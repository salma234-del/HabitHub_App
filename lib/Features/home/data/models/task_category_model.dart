import 'package:todo/Features/home/data/models/task_model.dart';

class TaskCategoryModel {
  final String category;
  final List<TaskModel> data;

  TaskCategoryModel({
    required this.category,
    required this.data,
  });

  factory TaskCategoryModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<TaskModel> dataList = list.map((i) => TaskModel.fromJson(i)).toList();

    return TaskCategoryModel(
      category: json['category'],
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
