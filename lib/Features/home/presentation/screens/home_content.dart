import 'package:flutter/material.dart';
import 'package:todo/Features/home/presentation/screens/widgets/home_days_section.dart';
import 'package:todo/Features/home/presentation/screens/widgets/home_tasks_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          HomeDaysSection(),
          SizedBox(height: 16),
          Expanded(child: HomeTasksSection()),
        ],
      ),
    );
  }
}
