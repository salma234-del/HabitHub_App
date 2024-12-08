import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Features/home/presentation/screens/widgets/task_item.dart';

class HomeTasksSection extends StatefulWidget {
  const HomeTasksSection({super.key});

  @override
  State<HomeTasksSection> createState() => _HomeTasksSectionState();
}

class _HomeTasksSectionState extends State<HomeTasksSection> {
  List<String> categoryList = ['ToDo', 'Done', 'Deleted', 'All'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: categoryList.mapIndexed((index, ele) {
              return _buildCategoryItem(
                index: index,
                category: ele,
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => const TaskItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required final int index,
    required final String category,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColor.purbleColor
              : AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedIndex == index
                ? AppColor.primaryColor
                : AppColor.blackColor.withOpacity(0.3),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7,
        ),
        margin: const EdgeInsetsDirectional.only(end: 8),
        child: Text(
          category,
          style: selectedIndex == index
              ? AppTextStyles.text12_500
              : AppTextStyles.text12_700.copyWith(
                  color: AppColor.blackColor.withOpacity(0.3),
                ),
        ),
      ),
    );
  }
}
