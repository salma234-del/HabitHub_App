import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/models/task_model.dart';

abstract class HomeRepo {
  Future<List<TaskCategoryModel>> getCategories();
  Future<void> addToDo({required TaskModel taskModel});
  Future<void> deleteTask({
    required int categoryIndex,
    required int taskIndex,
    required TaskModel taskModel,
  });
  Future<void> doneTask({
    required int categoryIndex,
    required int taskIndex,
    required TaskModel taskModel,
  });

  Future<void> updateTask({
    required int categoryIndex,
    required int taskIndex,
    required TaskModel taskModel,
  });
}