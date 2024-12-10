import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Core/services/tasks_categories_firestore_service.dart';
import 'package:todo/Core/utils/constants.dart';
import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';

class FirebaseFirestoreDatabase implements HomeRepo {
  final _tasksCategoriesService = TasksCategoriesFirestoreService();

  @override
  Future<void> addToDo({required TaskModel taskModel}) async {
    // add task to ToDo category
    QuerySnapshot<Object?> firestoreCategoryDocument =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: toDoCategory,
    );

    // update the category data
    await _tasksCategoriesService.updateCategoryData(
      firestoreCategoryDocument,
      taskModel,
    );

    // add task to All category
    QuerySnapshot<Object?> firestoreCategoryDocument2 =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: allCategory,
    );

    // update the category data
    await _tasksCategoriesService.updateCategoryData(
      firestoreCategoryDocument2,
      taskModel,
    );
  }

  @override
  Future<void> deleteTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // remove from ToDo
    QuerySnapshot<Object?> firestoreCategoryDocument =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: toDoCategory,
    );
    await _tasksCategoriesService.removeCategoryTask(
        firestoreCategoryDocument, taskModel);

    // add to Deleted
    QuerySnapshot<Object?> firestoreCategoryDocument2 =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: deletedCategory,
    );
    await _tasksCategoriesService.updateCategoryData(
      firestoreCategoryDocument2,
      taskModel,
    );
  }

  @override
  Future<void> doneTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // remove from ToDo
    QuerySnapshot<Object?> firestoreCategoryDocument =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: toDoCategory,
    );
    await _tasksCategoriesService.removeCategoryTask(
      firestoreCategoryDocument,
      taskModel,
    );

    // add to Done
    QuerySnapshot<Object?> firestoreCategoryDocument2 =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: doneCategory,
    );
    await _tasksCategoriesService.updateCategoryData(
      firestoreCategoryDocument2,
      taskModel,
    );
  }

  @override
  Future<List<TaskCategoryModel>> getCategories() async {
    List<TaskCategoryModel> categoriesList =
        await _tasksCategoriesService.getAllCategories();
    return categoriesList;
  }

  @override
  Future<void> updateTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // remove task from the category
    QuerySnapshot<Object?> firestoreCategoryDocument =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: category,
    );

    _tasksCategoriesService.removeCategoryTask(
      firestoreCategoryDocument,
      taskModel,
    );

    // add to ToDo
    QuerySnapshot<Object?> firestoreCategoryDocument2 =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: toDoCategory,
    );
    _tasksCategoriesService.updateCategoryData(
      firestoreCategoryDocument2,
      taskModel,
    );
  }

  @override
  Future<void> editTask({
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    // Get ToDo category
    QuerySnapshot<Object?> firestoreCategoryDocument =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: toDoCategory,
    );

    DocumentReference categoryRef = firestoreCategoryDocument.docs[0].reference;

    // Fetch the existing data
    DocumentSnapshot categorySnapshot = await categoryRef.get();
    List<dynamic> existingTasks = categorySnapshot['data'] ?? [];

    // Find the task by ID
    String taskId = taskModel.id; // Ensure `taskModel` has an `id` field
    int taskIndex = existingTasks.indexWhere((task) => task['id'] == taskId);

    existingTasks[taskIndex] = taskModel.toJson();
    await categoryRef.update({'data': existingTasks});

    // all category

    // Get ToDo category
    QuerySnapshot<Object?> firestoreCategoryDocument2 =
        await _tasksCategoriesService.getCategoryDocument(
      categryName: allCategory,
    );

    DocumentReference allCategoryRef =
        firestoreCategoryDocument2.docs[0].reference;

    // Fetch the existing data
    DocumentSnapshot categorySnapshot2 = await allCategoryRef.get();
    List<dynamic> existingTasks2 = categorySnapshot2['data'] ?? [];

    // Find the task by ID
    int taskIndex2 = existingTasks2.indexWhere((task) => task['id'] == taskId);

    existingTasks2[taskIndex2] = taskModel.toJson();
    await allCategoryRef.update({'data': existingTasks2});
  }
}
