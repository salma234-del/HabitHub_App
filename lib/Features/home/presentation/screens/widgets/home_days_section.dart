import 'package:flutter/material.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/functions/build_week_days.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Features/home/data/models/day_model.dart';
import 'package:collection/collection.dart';

class HomeDaysSection extends StatefulWidget {
  const HomeDaysSection({
    super.key,
  });

  @override
  State<HomeDaysSection> createState() => _HomeDaysSectionState();
}

class _HomeDaysSectionState extends State<HomeDaysSection> {
  List<DayModel> days = [];
  int selectedIndex = 0;

  @override
  void initState() {
    days = buildWeekDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColor.pinkColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectedIndex == 0 ? AppText.today : days[selectedIndex].day,
            style: AppTextStyles.text16_500,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: days.mapIndexed((index, day) {
                return _dayCard(
                  day: day,
                  index: index,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dayCard({
    required DayModel day,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColor.purbleColor
              : AppColor.unselectedDay,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day.day,
              style: selectedIndex == index
                  ? AppTextStyles.text12_700
                  : AppTextStyles.text12_500,
            ),
            const SizedBox(height: 6),
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColor.backgroundColor,
              child: Text(
                day.date,
                style: selectedIndex == index
                    ? AppTextStyles.text12_700
                    : AppTextStyles.text12_500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
