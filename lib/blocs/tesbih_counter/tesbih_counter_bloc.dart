import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_reader_app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tesbih_counter_event.dart';
part 'tesbih_counter_state.dart';

class TesbihCounterBloc extends Bloc<TesbihCounterEvent, TesbihCounterState> {
  final SharedPreferences cache;

  TesbihCounterBloc(this.cache)
      : super(TesbihCounterState(
            isHapticEnabled: cache.getBool('isHapticEnabled') ?? true,
            tesbihCount: cache.getInt('tesbihCount') ?? 0,
            tesbihSessionCount:
                cache.getInt('tesbihSessionCount') ?? kDefaultTesbihSession,
            period: cache.getInt('period') ?? 0)) {
    on<TesbihCounterEvent>((event, emit) {
      if (event is IncrementCounterEvent) {
        int newCount = state.tesbihCount + 1;
        int newPeriod = state.period;
        if (newCount == state.tesbihSessionCount) {
          newPeriod++;
          newCount = 0;
        }

        emit(TesbihCounterState(
            tesbihSessionCount: state.tesbihSessionCount,
            tesbihCount: newCount,
            period: newPeriod,
            isHapticEnabled: state.isHapticEnabled));
      }

      if (event is SaveCacheEvent) {
        saveCache();
      }

      if (event is UpdateHapticFeedbackEvent) {
        emit(TesbihCounterState(
            tesbihSessionCount: state.tesbihSessionCount,
            tesbihCount: state.tesbihCount,
            period: state.period,
            isHapticEnabled: !state.isHapticEnabled));
      }

      if (event is UpdateTesbihSessionCountEvent) {
        emit(TesbihCounterState(
            tesbihSessionCount: event.newCount,
            tesbihCount: 0,
            period: state.period,
            isHapticEnabled: state.isHapticEnabled));
      }

      if (event is ResetEvent) {
        emit(TesbihCounterState(
            tesbihSessionCount: state.tesbihSessionCount,
            tesbihCount: 0,
            period: 0,
            isHapticEnabled: state.isHapticEnabled));
      }
    });
  }

  @override
  Future<void> close() {
    add(SaveCacheEvent());
    return super.close();
  }

  void saveCache() {
    cache.setInt('tesbihCount', state.tesbihCount);
    cache.setInt('tesbihSessionCount', state.tesbihSessionCount);
    cache.setBool('isHapticEnabled', state.isHapticEnabled);
    cache.setInt('period', state.period);
  }
}
