import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';
import 'package:todo/Features/home/presentation/cubits/delete_task_cubit/delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.homeRepo) : super(DeleteTaskInitial());

  HomeRepo homeRepo;

  Future<void> deleteTask({
    required int categoryIndex,
    required int taskIndex,
    required TaskModel task,
  }) async {
    try {
      await homeRepo.deleteTask(
        categoryIndex: categoryIndex,
        taskIndex: taskIndex,
        taskModel: task,
      );
      emit(DeleteTaskSuccess());
    } catch (e) {
      emit(DeleteTaskError(message: e.toString()));
    }
  }
}
