import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Core/services/service_locator.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/presentation/cubits/%20get_category_tasks/get_categories_cubit.dart';
import 'package:todo/Features/home/presentation/cubits/%20get_category_tasks/get_categories_state.dart';
import 'package:todo/Features/home/presentation/cubits/delete_task_cubit/delete_task_cubit.dart';
import 'package:todo/Features/home/presentation/cubits/done_task_cubit/done_task_cubit.dart';
import 'package:todo/Features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:todo/Features/home/presentation/screens/widgets/empty_data.dart';
import 'package:todo/Features/home/presentation/screens/widgets/task_item.dart';

class HomeTasksSection extends StatefulWidget {
  const HomeTasksSection({super.key});

  @override
  State<HomeTasksSection> createState() => _HomeTasksSectionState();
}

class _HomeTasksSectionState extends State<HomeTasksSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCategoriesCubit(sl())..getCategories(category: selectedIndex),
        ),
        BlocProvider(
          create: (context) => DeleteTaskCubit(sl()),
        ),
        BlocProvider(
          create: (context) => DoneTaskCubit(sl()),
        ),
        BlocProvider(
          create: (context) => UpdateTaskCubit(sl()),
        ),
      ],
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCategoriesError) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          } else if (state is GetCategoriesSuccess) {
            var cubit = BlocProvider.of<GetCategoriesCubit>(context);
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.categories.mapIndexed((index, ele) {
                      return _buildCategoryItem(
                        index: index,
                        categoryItem: ele,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  state.categories[selectedIndex].data.isEmpty
                      ? const Expanded(child: EmptyData())
                      : Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => TaskItem(
                              task: state.categories[selectedIndex].data[index],
                              index: index,
                              category: state.categories[selectedIndex].category,
                              onDismissed: () {
                                cubit.getCategories(category: selectedIndex);
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                            itemCount:
                                state.categories[selectedIndex].data.length,
                          ),
                        ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildCategoryItem({
    required final int index,
    required final TaskCategoryModel categoryItem,
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
          categoryItem.category,
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
