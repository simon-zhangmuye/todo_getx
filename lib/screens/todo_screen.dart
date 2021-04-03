import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo.dart';

class TodoScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "What do you want to do",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              autofocus: true,
              style: TextStyle(fontSize: 25),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text("Cannel"),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      Get.back();
                    }),
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text("Add"),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      todoController.todos.add(
                        Todo(title: textEditingController.text),
                      );
                      Get.back();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
