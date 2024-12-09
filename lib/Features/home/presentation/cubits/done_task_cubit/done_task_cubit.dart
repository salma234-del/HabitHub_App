import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';

import 'done_task_state.dart';

class DoneTaskCubit extends Cubit<DoneTaskState> {
  DoneTaskCubit(this.homeRepo) : super(DoneTaskInitial());

  HomeRepo homeRepo;

  Future<void> doneTask({
    required String category,
    required int taskIndex,
    required TaskModel task,
  }) async {
    try {
      await homeRepo.doneTask(
        category: category,
        taskIndex: taskIndex,
        taskModel: task,
      );

      emit(DoneTaskSuccess());
    } catch (e) {
      emit(DoneTaskError(message: e.toString()));
    }
  }
}
