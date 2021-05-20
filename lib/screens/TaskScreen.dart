import 'package:flutter/material.dart';
import 'package:todoey/widgets/BottomSheetContent.dart';
import 'package:todoey/widgets/TaskList.dart';
import 'package:todoey/models/Task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'buy Bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => BottomSheetContent((newTaskTitle) {
              setState(() {
                tasks.add(Task(name: newTaskTitle));
              });
              Navigator.pop(context);
            }),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Center(child: Icon(Icons.add)),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.list,
                          size: 26,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text('Todoey',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 18,
                    ),
                    Text(tasks.length.toString() + ' tasks',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: TaskList(
                  tasks,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
