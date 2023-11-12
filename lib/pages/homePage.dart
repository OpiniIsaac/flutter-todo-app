import 'package:flutter/material.dart';
import 'package:todo_app/utilis/todo_tiles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of todos
  List todoList = [
    ['make tutorial', false],
    ['Do course work', true],
  ];

  // check box change function
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(
          'TODO APP',
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            onChanged: (value) => checkBoxChanged(value, index),
            taskCompleted: todoList[index][1],
            taskName: todoList[index][0],
          );
        },
      ),
    );
  }
}
