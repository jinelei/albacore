import 'package:albacore/todo/add-todo-model.dart';
import 'package:flutter/material.dart';
import 'package:albacore/todo/todo-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TodoView(),
      routes: <String, WidgetBuilder> {
        '/todo': (_) => new TodoView(),
        '/todo/add': (_) => new AddTodoView(),
      },
    );
  }
}
