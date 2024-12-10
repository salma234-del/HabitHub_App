abstract class DoneTaskState {}

class DoneTaskInitial extends DoneTaskState {}

class DoneTaskLoading extends DoneTaskState {}

class DoneTaskSuccess extends DoneTaskState {}

class DoneTaskError extends DoneTaskState {
  final String message;

  DoneTaskError({required this.message});
}
