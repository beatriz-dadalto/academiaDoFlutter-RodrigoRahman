import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(color: Colors.grey)],
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: EdgeInsets.all(8.0),
          leading: Checkbox(value: true, onChanged: (value) {}),
          title: Text(
            'Descrição da TASK',
            style: TextStyle(
              decoration: true ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            '27/07/2021',
            style: TextStyle(
              decoration: true ? TextDecoration.lineThrough : null,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(width: 1.0),
          ),
        ),
      ),
    );
  }
}
