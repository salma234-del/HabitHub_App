abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}

class EditTaskLoading extends EditTaskState {}

class EditTaskSuccess extends EditTaskState {}

class EditTaskError extends EditTaskState {
  final String message;

  EditTaskError({required this.message});
}
