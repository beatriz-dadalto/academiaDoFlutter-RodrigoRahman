import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/total_tasks_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';

class TodoCardFilter extends StatelessWidget {
  final String label;
  final TaskFilterEnum taskFilter;
  final TotalTasksModel? totalTasksModel;
  final bool selected;

  const TodoCardFilter({
    super.key,
    required this.label,
    required this.taskFilter,
    this.totalTasksModel,
    required this.selected,
  });

  double _getPercentFinished() {
    final total = totalTasksModel?.totalTasks ?? 0;
    final totalFinished = totalTasksModel?.totalTasksFinished ?? 0.1;

    if (total == 0) {
      return 0.0;
    }

    final percent = (totalFinished * 100) / total;
    return percent / 100;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<HomeController>().findtasks(filter: taskFilter),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 150,
        constraints: BoxConstraints(minHeight: 120, maxHeight: 150),
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: selected ? context.primaryColor : Colors.white,
          border: Border.all(width: 1, color: Colors.grey.withAlpha(80)),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${(totalTasksModel?.totalTasks ?? 0) - (totalTasksModel?.totalTasksFinished ?? 0)} tasks',
              style: context.titleStyle.copyWith(
                fontSize: 10.0,
                color: selected ? Colors.white : Colors.grey,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: _getPercentFinished()),
              duration: Duration(seconds: 1),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  backgroundColor: selected
                      ? context.primaryColorLight
                      : Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    selected ? Colors.white : context.primaryColor,
                  ),
                  value: value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
