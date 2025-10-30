import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/widgets/task.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Selector<HomeController, String>(
          builder: (context, tasks, child) {
            return Text(
              'Tasks $tasks'.toUpperCase(),
              style: context.titleStyle,
            );
          },
          selector: (context, controller) {
            return controller.filterSelected.description;
          },
        ),
        SizedBox(height: 10.0),
        Column(
          children: context
              .select<HomeController, List<TaskModel>>(
                (controller) => controller.filteredTasks,
              )
              .map((task) => Task(taskModel: task))
              .toList(),
        ),
      ],
    );
  }
}
