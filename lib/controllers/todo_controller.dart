import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx/models/todo.dart';

class TodoController extends GetxController {
  // ignore: deprecated_member_use
  var todos = List<Todo>().obs;

  @override
  void onInit() {
    List storeTodos = GetStorage().read<List>('todos');
    if (storeTodos != null) {
      todos = storeTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }

    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });

    super.onInit();
  }
}
