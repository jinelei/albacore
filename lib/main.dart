import 'package:albacore/todo/add-todo-model.dart';
import 'package:flutter/material.dart';
import 'package:albacore/todo/todo-view.dart';
import 'package:albacore/flare/flare-view.dart';
import 'package:logging/logging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
      if (rec.error != null && rec.stackTrace != null) {
        print('${rec.error}: ${rec.stackTrace}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TodoView(),
      routes: <String, WidgetBuilder>{
        '/todo': (_) => new TodoView(),
        '/todo/add': (_) => new AddTodoView(),
        '/flare': (_) => new FlareView(),
      },
    );
  }
}
