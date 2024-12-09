import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';
import 'package:todo/Features/home/presentation/cubits/update_task_cubit/update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.homeRepo) : super(UpdateTaskInitial());

  HomeRepo homeRepo;

  Future<void> updateTask({
    required String category,
    required int taskIndex,
    required TaskModel task,
  }) async {
    try {
      await homeRepo.updateTask(
        category: category,
        taskIndex: taskIndex,
        taskModel: task,
      );

      emit(UpdateTaskSuccess());
    } catch (e) {
      emit(UpdateTaskError(message: e.toString()));
    }
  }
}
