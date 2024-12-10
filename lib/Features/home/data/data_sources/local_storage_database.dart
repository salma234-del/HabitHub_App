import 'package:hive/hive.dart';
import 'package:todo/Core/utils/constants.dart';
import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';

class LocalStorageDataBase implements HomeRepo {
  final _box = Hive.box(tasksCategoriesBox);

  // final List<TaskCategoryModel> _categories = [
  //   TaskCategoryModel(category: 'ToDo', data: []),
  //   TaskCategoryModel(category: 'Done', data: []),
  //   TaskCategoryModel(category: 'Deleted', data: []),
  //   TaskCategoryModel(category: 'All', data: []),
  // ];

  @override
  Future<void> addToDo({required TaskModel taskModel}) async {
    // Retrieve the stored categories list from Hive
    List<dynamic> categoriesLis = _box.get(tasksCategoriesBox) ?? [];

    // Deserialize the stored data into a list of TaskCategoryModel
    List<TaskCategoryModel> categoriesList = categoriesLis
        .map((e) =>
            TaskCategoryModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    // Add the task to the "ToDo" category (index 0 by assumption)
    categoriesList[0].data.add(taskModel);
    categoriesList[3].data.add(taskModel);

    // Serialize the updated categoriesList back into JSON and save to Hive
    await _box.put(
      tasksCategoriesBox,
      categoriesList.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // Retrieve stored categories from Hive.
    List<dynamic>? storedCategories = _box.get(tasksCategoriesBox) ?? [];

    // Deserialize stored categories into a list of TaskCategoryModel.
    List<TaskCategoryModel> categories = storedCategories!
        .map((e) =>
            TaskCategoryModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    // Remove the task from the specified category.
    int categoryIndex =
        categories.indexWhere((element) => element.category == category);

    categories[categoryIndex].data.removeAt(taskIndex);

    // Add the task to the 'Deleted' category (index 2).
    categories[2].data.add(taskModel);

    // Serialize the updated list back into JSON and save it to Hive.
    await _box.put(
      tasksCategoriesBox,
      categories.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> doneTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // Retrieve stored categories from Hive.
    List<dynamic>? storedCategories = _box.get(tasksCategoriesBox) ?? [];

    // Deserialize stored categories into a list of TaskCategoryModel.
    List<TaskCategoryModel> categories = storedCategories!
        .map((e) =>
            TaskCategoryModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    int categoryIndex =
        categories.indexWhere((element) => element.category == category);

    // Remove the task from the specified category.
    categories[categoryIndex].data.removeAt(taskIndex);

    // Add the task to the 'Done' category (index 1).
    categories[1].data.add(taskModel);

    // Serialize the updated list back into JSON and save it to Hive.
    await _box.put(
      tasksCategoriesBox,
      categories.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<List<TaskCategoryModel>> getCategories() async {
    // Retrieve the stored list from Hive.
    List<dynamic>? storedCategories = _box.get(tasksCategoriesBox);
    // Default categories to initialize if none exist.
    List<TaskCategoryModel> defaultCategories = [
      TaskCategoryModel(category: 'ToDo', data: []),
      TaskCategoryModel(category: 'Done', data: []),
      TaskCategoryModel(category: 'Deleted', data: []),
      TaskCategoryModel(category: 'All', data: []),
    ];

    if (storedCategories == null) {
      // Save the default categories to Hive if none exist.
      await _box.put(
        tasksCategoriesBox,
        defaultCategories.map((e) => e.toJson()).toList(),
      );

      return defaultCategories;
    } else {
      // Deserialize each element of the stored data into TaskCategoryModel.
      List<TaskCategoryModel> categories = storedCategories
          .map((e) =>
              TaskCategoryModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      return categories;
    }
  }

  @override
  Future<void> updateTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // Retrieve stored categories from Hive.
    List<dynamic>? storedCategories = _box.get(tasksCategoriesBox) ?? [];

    // Deserialize stored categories into a list of TaskCategoryModel.
    List<TaskCategoryModel> categories = storedCategories!
        .map((e) =>
            TaskCategoryModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    int categoryIndex =
        categories.indexWhere((element) => element.category == category);
    // Remove the task from the specified category.
    categories[categoryIndex].data.removeAt(taskIndex);

    // Add the task to the 'ToDo' category (index 2).
    categories[0].data.add(taskModel);

    // Serialize the updated list back into JSON and save it to Hive.
    await _box.put(
      tasksCategoriesBox,
      categories.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> editTask({
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // Retrieve stored categories from Hive.
    List<dynamic>? storedCategories = _box.get(tasksCategoriesBox) ?? [];

    // Deserialize stored categories into a list of TaskCategoryModel.
    List<TaskCategoryModel> categories = storedCategories!
        .map((e) =>
            TaskCategoryModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    int categoryIndex =
        categories.indexWhere((element) => element.category == toDoCategory);

    int allCategoryIndex =
        categories.indexWhere((element) => element.category == allCategory);
    // Remove the task from the specified category.
    categories[categoryIndex].data.removeAt(taskIndex);
    categories[allCategoryIndex].data.removeAt(taskIndex);

    // Add the task to the 'ToDo' category (index 2).
    categories[0].data.add(taskModel);
    categories[3].data.add(taskModel);

    // Serialize the updated list back into JSON and save it to Hive.
    await _box.put(
      tasksCategoriesBox,
      categories.map((e) => e.toJson()).toList(),
    );
  }
}
