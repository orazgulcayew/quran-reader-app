part of 'tesbih_counter_bloc.dart';

class TesbihCounterState extends Equatable {
  final int tesbihSessionCount;
  final int tesbihCount;
  final bool isHapticEnabled;
  final int period;
  const TesbihCounterState({
    required this.tesbihSessionCount,
    required this.tesbihCount,
    required this.isHapticEnabled,
    required this.period,
  });

  @override
  List<Object> get props => [
        tesbihSessionCount,
        tesbihCount,
        isHapticEnabled,
      ];
}
