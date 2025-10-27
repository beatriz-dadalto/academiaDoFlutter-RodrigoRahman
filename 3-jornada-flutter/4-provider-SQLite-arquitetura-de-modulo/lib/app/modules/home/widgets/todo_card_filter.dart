import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class TodoCardFilter extends StatefulWidget {
  const TodoCardFilter({super.key});

  @override
  State<TodoCardFilter> createState() => _TodoCardFilterState();
}

class _TodoCardFilterState extends State<TodoCardFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      constraints: BoxConstraints(minHeight: 120, maxHeight: 150),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(width: 1, color: Colors.grey.withAlpha(80)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10 tasks',
            style: context.titleStyle.copyWith(
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
          Text(
            'Hoje',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: context.primaryColorLight,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            value: 0.4,
          ),
        ],
      ),
    );
  }
}
