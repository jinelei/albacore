import 'package:albacore/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  TodoBloc bLoC = new TodoBloc();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static TodoBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;
}
