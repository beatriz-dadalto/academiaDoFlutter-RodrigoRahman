import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';

class Task extends StatelessWidget {
  final TaskModel taskModel;
  final dateFormat = DateFormat('dd/MM/y');

  Task({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(taskModel.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.0),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(Icons.delete_forever, color: Colors.white, size: 40),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text('Confirmar'),
            content: Text(
              'Deseja deletar a tarefa "${taskModel.description}"?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: Text('Deletar', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        context.read<HomeController>().deleteTask(taskModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [BoxShadow(color: Colors.grey)],
        ),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: IntrinsicHeight(
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: Checkbox(
              value: taskModel.finished,
              onChanged: (value) =>
                  context.read<HomeController>().checkOrUncheckTask(taskModel),
            ),
            title: Text(
              taskModel.description,
              style: TextStyle(
                decoration: taskModel.finished
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            subtitle: Text(
              dateFormat.format(taskModel.dateTime),
              style: TextStyle(
                decoration: taskModel.finished
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
