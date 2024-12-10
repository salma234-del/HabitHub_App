import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';
import 'package:todo/Features/home/presentation/cubits/edit_task_cubit/edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this.homeRepo) : super(EditTaskInitial());

  HomeRepo homeRepo;

  Future<void> editTask({
    required int taskIndex,
    required TaskModel task,
  }) async {
    emit(EditTaskLoading());
    try {
      await homeRepo.editTask(
        taskIndex: taskIndex,
        taskModel: task,
      );
      emit(EditTaskSuccess());
    } catch (e) {
      emit(EditTaskError(message: e.toString()));
    }
  }
}
