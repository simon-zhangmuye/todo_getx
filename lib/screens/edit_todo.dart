import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class TodoEdit extends StatelessWidget {
  final int index;
  final TodoController todoController = Get.find<TodoController>();

  TodoEdit({@required this.index});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todoController.todos[index].title);
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
                    child: Text("Edit"),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      var editing = todoController.todos[index];
                      editing.title = textEditingController.text;
                      todoController.todos[index] = editing;
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
