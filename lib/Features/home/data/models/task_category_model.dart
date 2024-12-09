import 'package:hive/hive.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
part 'task_category_model.g.dart';

@HiveType(typeId: 0)
class TaskCategoryModel {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final List<TaskModel> data;

  TaskCategoryModel({
    required this.category,
    required this.data,
  });

  factory TaskCategoryModel.fromJson(Map<String, dynamic> json) {
    return TaskCategoryModel(
      category: json['category'],
      data: (json['data'] as List)
          .map((e) => TaskModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
