import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Features/home/presentation/screens/widgets/day_item.dart';

class HomeDaysSection extends StatelessWidget {
  const HomeDaysSection({
    super.key,
  });

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
          const Text(
            'Today',
            style: AppTextStyles.text16_500,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DayItem(
                  isActive: false,
                  day: 'Sun',
                  date: '12',
                  onTap: () {},
                ),
                DayItem(
                  isActive: true,
                  day: 'Mon',
                  date: '13',
                  onTap: () {},
                ),
                DayItem(
                  isActive: false,
                  day: 'Tue',
                  date: '14',
                  onTap: () {},
                ),
                DayItem(
                  isActive: false,
                  day: 'Wed',
                  date: '15',
                  onTap: () {},
                ),
                DayItem(
                  isActive: false,
                  day: 'Thu',
                  date: '16',
                  onTap: () {},
                ),
                DayItem(
                  isActive: false,
                  day: 'Fri',
                  date: '17',
                  onTap: () {},
                ),
                DayItem(
                  isActive: false,
                  day: 'Sat',
                  date: '18',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
