import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';
import 'package:todo/Features/home/presentation/cubits/add_task/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(
    this.homeRepo,
  ) : super(AddTaskInitial());

  HomeRepo homeRepo;

  Future<void> addTask({
    required TaskModel taskModel,
  }) async {
    emit(AddTaskLoading());
    try {
      await homeRepo.addToDo(taskModel: taskModel);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskError(message: e.toString()));
    }
  }
}
