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
  @HiveField(5)
  final String id;

  TaskModel({
    required this.title,
    required this.body,
    required this.color,
    required this.date,
    required this.time,
    required this.id,
  });

  factory TaskModel.fromJson(json) {
    return TaskModel(
      title: json['title'],
      body: json['body'],
      color: Color(int.parse(json['color'])),
      date: json['date'],
      time: json['time'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'color': color.value.toString(),
      'date': date,
      'time': time,
      'id': id,
    };
  }
}
