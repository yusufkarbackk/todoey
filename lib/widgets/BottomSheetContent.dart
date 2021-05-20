import 'package:flutter/material.dart';
import 'package:todoey/models/Task.dart';

class BottomSheetContent extends StatelessWidget {
  final Function addTaskCallback;
  BottomSheetContent(this.addTaskCallback);
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF757575)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Text('Add Text',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.lightBlueAccent, fontSize: 22)),
              TextField(
                autofocus: true,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(
                height: 12,
              ),
              FlatButton(
                onPressed: () {
                  addTaskCallback(newTaskTitle);
                },
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Text('Add',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
