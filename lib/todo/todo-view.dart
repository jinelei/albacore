import 'package:albacore/bloc/todo_bloc.dart';
import 'package:albacore/utils.dart';
import 'package:flutter/material.dart';
import 'package:albacore/todo/todo-model.dart';
import 'package:intl/intl.dart';

class TodoView extends StatefulWidget {
  @override
  createState() => _TodoState();
}

class _TodoState extends State<TodoView> {
  DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _dateFormat = new DateFormat("yyyy-MM-dd hh:mm");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo'),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _addTodoModel(context);
            },
          )
        ],
      ),
      drawer: Utils.generateDrawer(context),
      body: StreamBuilder<List<TodoModel>>(
        stream: bLoc.stream,
        initialData: bLoc.value,
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          return _buildWidget();
        },
      ),
    );
  }

  Widget _buildWidget() {
    if (bLoc.value == null || bLoc.value.length == 0) {
      return Text('in todo');
    } else {
      return ListView.builder(
        itemCount: bLoc.value.length,
        itemBuilder: (BuildContext context, int index) {
          assert(index >= 0 && bLoc.value.length > index,
              'index out of bLoc.value.length');
          TodoModel _tmp = bLoc.value[index];
          return Card(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '${_tmp.name}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${_tmp.description}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${_dateFormat.format(_tmp.startTime)}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' ~ ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${_dateFormat.format(_tmp.endTime)}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ));
        },
      );
    }
  }

  _addTodoModel(BuildContext context) {
    Navigator.of(context).pushNamed('/todo/add');
  }
}
