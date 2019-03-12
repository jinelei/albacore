import 'dart:async';
import 'package:albacore/pages/todo/todo-model.dart';

class TodoBloc {
  List<TodoModel> _todoList;
  StreamController<List<TodoModel>> _controller;

  TodoBloc() {
    _todoList = new List();
    _controller = new StreamController<List<TodoModel>>.broadcast();
  }

  Stream<List<TodoModel>> get stream => _controller.stream;
  List<TodoModel> get value => _todoList;

  addTodo(TodoModel model) {
    _todoList.add(model);
  }

  removeTodo(TodoModel model) {
    _todoList.remove(model);
  }

  updateTodo(TodoModel model) {
    int idx = _todoList.indexOf(model);
    assert(_todoList.indexOf(model) > -1);
    _todoList[idx].name = model.name;
    _todoList[idx].description = model.description;
    _todoList[idx].startTime = model.startTime;
    _todoList[idx].endTime = model.endTime;
    _todoList[idx].finished = model.finished;
  }
}

TodoBloc bLoc = new TodoBloc();
