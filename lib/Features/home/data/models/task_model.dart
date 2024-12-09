import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final Color color;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String time;

  TaskModel({
    required this.title,
    required this.body,
    required this.color,
    required this.date,
    required this.time,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      body: json['body'],
      color: Color(int.parse(json['color'])),
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'color': color.value.toString(),
      'date': date,
      'time': time,
    };
  }
}
