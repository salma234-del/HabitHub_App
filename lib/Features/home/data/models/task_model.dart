import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String body;
  final Color color;
  final String date;
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
