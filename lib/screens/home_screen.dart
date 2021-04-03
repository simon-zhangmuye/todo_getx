import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/screens/edit_todo.dart';

import 'todo_screen.dart';

class HomeScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Todo"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(() {
          return ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (_) {
                      todoController.todos.removeAt(index);
                      Get.snackbar("remove successfully", "task was deleted!",
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: ListTile(
                      title: Text(todoController.todos[index].title,
                          style: todoController.todos[index].done
                              ? TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough)
                              : TextStyle(
                                  color: Colors.black,
                                )),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Get.to(TodoEdit(index: index));
                        },
                      ),
                      leading: Checkbox(
                        value: todoController.todos[index].done,
                        onChanged: (newValue) {
                          var todo = todoController.todos[index];
                          todo.done = newValue;
                          todoController.todos[index] = todo;
                        },
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: todoController.todos.length);
        }),
      ),
    );
  }
}
