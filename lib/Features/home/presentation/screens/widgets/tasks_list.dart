import 'package:flutter/material.dart';
import 'package:todo/Features/home/presentation/screens/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const TaskItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 10,
    );
  }
}
