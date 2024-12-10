import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/constants.dart';
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
    required this.category,
    required this.onDismissed,
    super.key,
  });

  final TaskModel task;
  final int index;
  final String category;
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
      child: Slidable(
        key: Key(index.toString()),
        startActionPane: category == toDoCategory
            ? ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      GoRouter.of(context).push(AppRouter.addTask, extra: {
                        'task': task,
                        'taskIndex': index,
                      });
                    },
                    icon: Icons.edit,
                    foregroundColor: AppColor.whiteColor,
                    backgroundColor: Colors.blue,
                    label: 'Edit',
                  ),
                ],
              )
            : null,
        endActionPane: category == allCategory
            ? null
            : ActionPane(
                motion: const ScrollMotion(),
                children: [
                  if (category == toDoCategory) ...[
                    SlidableAction(
                      onPressed: (context) async {
                        await BlocProvider.of<DoneTaskCubit>(context).doneTask(
                          category: category,
                          taskIndex: index,
                          task: task,
                        );
                        onDismissed();
                      },
                      icon: Icons.check_circle,
                      foregroundColor: AppColor.whiteColor,
                      backgroundColor: Colors.green,
                      label: 'Done',
                    ),
                    SlidableAction(
                      onPressed: (context) async {
                        await BlocProvider.of<DeleteTaskCubit>(context)
                            .deleteTask(
                          category: category,
                          taskIndex: index,
                          task: task,
                        );
                        onDismissed();
                      },
                      icon: Icons.delete,
                      foregroundColor: AppColor.whiteColor,
                      backgroundColor: Colors.red,
                      label: 'Delete',
                    ),
                  ],
                  if (category == doneCategory)
                    SlidableAction(
                      onPressed: (context) async {
                        await BlocProvider.of<UpdateTaskCubit>(context)
                            .updateTask(
                          category: category,
                          taskIndex: index,
                          task: task,
                        );
                        onDismissed();
                      },
                      icon: Icons.undo,
                      foregroundColor: AppColor.whiteColor,
                      backgroundColor: Colors.blue,
                      label: 'Undo',
                    ),
                  if (category == deletedCategory)
                    SlidableAction(
                      onPressed: (context) async {
                        await BlocProvider.of<UpdateTaskCubit>(context)
                            .updateTask(
                          category: category,
                          taskIndex: index,
                          task: task,
                        );
                        onDismissed();
                      },
                      icon: Icons.restore_from_trash,
                      foregroundColor: AppColor.whiteColor,
                      backgroundColor: Colors.blue,
                      label: 'Restore',
                    ),
                ],
              ),
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
