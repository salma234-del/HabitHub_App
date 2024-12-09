import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Core/utils/constants.dart';
import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/models/task_model.dart';

class TasksCategoriesFirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getCategoryDocument({
    required String categryName,
  }) async {
    QuerySnapshot firestoreCategoryDocument = await _firebaseFirestore
        .collection(tasksCategoriesCollection)
        .where(categoryField, isEqualTo: categryName)
        .get();
    return firestoreCategoryDocument;
  }

  Future<void> updateCategoryData(
    QuerySnapshot<Object?> firestoreCategoryDocument,
    TaskModel taskModel,
  ) async {
    await _firebaseFirestore
        .collection(tasksCategoriesCollection)
        .doc(firestoreCategoryDocument.docs[0].id)
        .update({
      dataField: FieldValue.arrayUnion([taskModel.toJson()])
    });
  }

  Future<List<TaskCategoryModel>> getAllCategories() async {
    QuerySnapshot categories =
        await _firebaseFirestore.collection(tasksCategoriesCollection).get();

    List<TaskCategoryModel> categoriesList = [];
    categoriesList = categories.docs
        .map(
            (e) => TaskCategoryModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return categoriesList;
  }

  Future<void> removeCategoryTask(
      QuerySnapshot<Object?> firestoreCategoryDocument,
      TaskModel taskModel) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(tasksCategoriesCollection)
        .doc(firestoreCategoryDocument.docs.first.id);

    // Remove the task with the given ID from the array
    await docRef.update(
      {
        dataField: FieldValue.arrayRemove([taskModel.toJson()]),
      },
    );
  }
}
