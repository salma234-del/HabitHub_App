import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/services/service_locator.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Core/widgets/custom_text_form_field.dart';
import 'package:todo/Features/add_task/presentation/screens/widgets/close_icon.dart';
import 'package:todo/Features/add_task/presentation/screens/widgets/color_circle.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/presentation/cubits/add_task/add_task_cubit.dart';
import 'package:todo/Features/home/presentation/cubits/add_task/add_task_state.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final TextEditingController timeController = TextEditingController();
  Color? selectedColor;
  String colorRequired = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(sl()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.blueBg,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
              child: BlocConsumer<AddTaskCubit, AddTaskState>(
                listener: (context, state) {
                  if (state is AddTaskLoading) {
                    isLoading = true;
                  } else if (state is AddTaskError) {
                  } else if (state is AddTaskSuccess) {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).pushReplacement(AppRouter.layout);
                  }
                },
                builder: (context, state) {
                  var cubit = BlocProvider.of<AddTaskCubit>(context);
                  return Form(
                    key: formKey,
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
                        _buildColorsListView(),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            colorRequired,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                hintText: AppText.date,
                                controller: dateController,
                                readOnly: true,
                                onTap: _showDatePicker,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomTextFormField(
                                hintText: AppText.time,
                                controller: timeController,
                                readOnly: true,
                                onTap: _showTimePicker,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (selectedColor == null) {
                                setState(() {
                                  colorRequired = 'Color is required';
                                });
                              } else {
                                cubit.addTask(
                                  taskModel: TaskModel(
                                    title: taskTitleController.text,
                                    body: taskDescriptionController.text,
                                    color: selectedColor!,
                                    date: dateController.text,
                                    time: timeController.text,
                                  ),
                                );
                                setState(() {
                                  colorRequired = '';
                                });
                              }
                            }
                          },
                          child: const Text(AppText.addTask),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
      lastDate: DateTime.now().add(const Duration(days: 6)),
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

  Widget _buildColorsListView() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () => setState(() {
            selectedColor = AppColor.cardColors[index];
          }),
          child: ColorCircle(
            color: AppColor.cardColors[index],
            isSelected: selectedColor == AppColor.cardColors[index],
          ),
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsetsDirectional.only(end: 16),
        ),
        itemCount: AppColor.cardColors.length,
      ),
    );
  }
}
