import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final taskName;
  final taskCompleted;
  Function(bool?)? onChanged;

  TodoTile(
      {super.key,
      required this.onChanged,
      required this.taskCompleted,
      required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black),
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.yellow[400], borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
