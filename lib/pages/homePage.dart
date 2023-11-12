import 'package:flutter/material.dart';
import 'package:todo_app/utilis/dailog_box.dart';
import 'package:todo_app/utilis/todo_tiles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller

  final _controller = TextEditingController();
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
// create a new task

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);

      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSaved: saveNewTask,
          );
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
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
