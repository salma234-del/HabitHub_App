import 'package:todo/Features/home/data/models/task_category_model.dart';

abstract class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoading extends GetCategoriesState {}

class GetCategoriesSuccess extends GetCategoriesState {
  final List<TaskCategoryModel> categories;

  GetCategoriesSuccess({required this.categories});
}

class GetCategoriesError extends GetCategoriesState {
  final String message;

  GetCategoriesError({required this.message});
}
