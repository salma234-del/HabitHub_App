import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Features/home/presentation/screens/widgets/empty_data.dart';
import 'package:todo/Features/home/presentation/screens/widgets/home_days_section.dart';
import 'package:todo/Features/home/presentation/screens/widgets/tasks_list.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Column(
          children: [
            const HomeDaysSection(),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.15,
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.grey,
                dividerColor: AppColor.backgroundColor,
                indicator: BoxDecoration(
                  color: AppColor.purbleColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                labelColor: AppColor.blackColor,
                tabs: const [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                  Tab(
                    text: 'Deleted',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),
                child: TabBarView(
                  children: [
                    TasksList(),
                    EmptyData(),
                    EmptyData(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
