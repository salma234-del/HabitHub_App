import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/presentation/cubits/delete_task_cubit/delete_task_cubit.dart';
import 'package:todo/Features/home/presentation/cubits/delete_task_cubit/delete_task_state.dart';
import 'package:todo/Features/home/presentation/cubits/done_task_cubit/done_task_cubit.dart';
import 'package:todo/Features/home/presentation/cubits/done_task_cubit/done_task_state.dart';
import 'package:todo/Features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:todo/Features/home/presentation/cubits/update_task_cubit/update_task_state.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    required this.index,
    required this.categoryIndex,
    required this.onDismissed,
    super.key,
  });

  final TaskModel task;
  final int index;
  final int categoryIndex;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeleteTaskCubit, DeleteTaskState>(
          listener: (context, state) {
            if (state is DeleteTaskSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task deleted.')),
              );
            }
            if (state is DeleteTaskError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
        BlocListener<DoneTaskCubit, DoneTaskState>(
          listener: (context, state) {
            if (state is DoneTaskSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task marked as done.')),
              );
            }
            if (state is DoneTaskError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
        BlocListener<UpdateTaskCubit, UpdateTaskState>(
          listener: (context, state) {
            if (state is UpdateTaskSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task addd to ToDo.')),
              );
            }
            if (state is UpdateTaskError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
      ],
      child: Dismissible(
        key: Key(index.toString()),
        onDismissed: (direction) async {
          if (categoryIndex == 0) {
            if (direction == DismissDirection.startToEnd) {
              // delete task
              await BlocProvider.of<DeleteTaskCubit>(context).deleteTask(
                categoryIndex: categoryIndex,
                taskIndex: index,
                task: task,
              );
            } else {
              // done task
              await BlocProvider.of<DoneTaskCubit>(context).doneTask(
                categoryIndex: categoryIndex,
                taskIndex: index,
                task: task,
              );
            }
          } else {
            await BlocProvider.of<UpdateTaskCubit>(context).updateTask(
              categoryIndex: categoryIndex,
              taskIndex: index,
              task: task,
            );
          }
          onDismissed();
        },
        confirmDismiss: (direction) async {
          if (categoryIndex == 3) {
            // Prevent dismissal for categoryIndex == 3
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Cannot dismiss tasks in this category.')),
            );
            return false;
          }
          return true;
        },
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Icon(
              categoryIndex == 0 ? Icons.delete : Icons.check_circle,
              color: AppColor.whiteColor,
            ),
          ),
        ),
        secondaryBackground: categoryIndex == 0
            ? Container(
                color: Colors.green,
                child: const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(
                    Icons.check_box,
                    color: AppColor.whiteColor,
                  ),
                ),
              )
            : null,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(task.color.value),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: AppTextStyles.text16_500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(task.date),
                      Text(task.time),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                task.body,
                style: AppTextStyles.text14_400,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
