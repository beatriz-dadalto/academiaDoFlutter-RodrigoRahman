import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_controller.dart';

class CalendarButton extends StatelessWidget {
  CalendarButton({super.key});

  final dateFormat = DateFormat('dd/MM/yy');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.add(Duration(days: 10 * 365));

        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2025),
          lastDate: lastDate,
        );

        if (selectedDate != null && context.mounted) {
          context.read<TaskCreateController>().selectedDate = selectedDate;
        }
      },
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.today, color: Colors.grey),
            SizedBox(width: 10.0),
            Selector<TaskCreateController, DateTime?>(
              selector: (context, controller) => controller.selectedDate,
              builder: (context, value, child) {
                if (value != null) {
                  return Text(
                    dateFormat.format(value),
                    style: context.titleStyle,
                  );
                } else {
                  return Text('SELECIONE UMA DATA', style: context.titleStyle);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
