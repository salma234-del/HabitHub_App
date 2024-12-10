import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/models/task_model.dart';

abstract class HomeRepo {
  Future<List<TaskCategoryModel>> getCategories();
  Future<void> addToDo({required TaskModel taskModel});
  Future<void> deleteTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  });
  Future<void> doneTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  });

  Future<void> updateTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  });
  Future<void> editTask({
    required int taskIndex,
    required TaskModel taskModel,
  });
}
