part of 'tesbih_counter_bloc.dart';

abstract class TesbihCounterEvent extends Equatable {
  const TesbihCounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends TesbihCounterEvent {}

class SaveCacheEvent extends TesbihCounterEvent {}

class ResetEvent extends TesbihCounterEvent {}

class UpdateTesbihSessionCountEvent extends TesbihCounterEvent {
  final int newCount;
  const UpdateTesbihSessionCountEvent({required this.newCount});

  @override
  List<Object> get props => [newCount];
}

class UpdateHapticFeedbackEvent extends TesbihCounterEvent {}
