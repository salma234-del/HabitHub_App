import 'package:flutter/material.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Core/widgets/custom_text_form_field.dart';
import 'package:todo/Features/add_task/presentation/screens/widgets/close_icon.dart';
import 'package:todo/Features/add_task/presentation/screens/widgets/colors_listview.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blueBg,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(star),
                          const Text(
                            AppText.newTask,
                            style: AppTextStyles.text24_500,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: CloseIcon(),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  hintText: AppText.taskTitle,
                  controller: taskTitleController,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: AppText.taskDescription,
                  controller: taskDescriptionController,
                ),
                const SizedBox(height: 32),
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    AppText.cardColor,
                    style: AppTextStyles.text14_700,
                  ),
                ),
                const SizedBox(height: 12),
                const ColorsListView(),
                const SizedBox(height: 32),
                CustomTextFormField(
                  hintText: AppText.date,
                  controller: dateController,
                  readOnly: true,
                  onTap: _showDatePicker,
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  hintText: AppText.time,
                  controller: timeController,
                  readOnly: true,
                  onTap: _showTimePicker,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(AppText.addTask),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (selectedDate != null) {
      dateController.text =
          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    }
  }

  Future<void> _showTimePicker() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      timeController.text = "${selectedTime.hour}:${selectedTime.minute}";
    }
  }
}
