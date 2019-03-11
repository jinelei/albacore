import 'dart:async';

import 'package:albacore/todo/todo-model.dart';

class TodoBloc {
  List<TodoModel> _todoList;
  StreamController<List<TodoModel>> _controller;

  TodoBloc() {
    _todoList = new List();
    _controller = new StreamController<List<TodoModel>>.broadcast();
  }

  Stream<List<TodoModel>> get stream => _controller.stream;
  List<TodoModel> get value => _todoList;

  addTodo(TodoModel model) => _todoList.add(model);

  removeTodo(TodoModel model) => _todoList.remove(model);
}

TodoBloc bLoc = new TodoBloc();
