import 'package:flutter/material.dart';
import 'package:albacore/todo/todo-model.dart';

class TodoView extends StatefulWidget {
  @override
  createState() => _TodoState();
}

class _TodoState extends State<TodoView> {
  List<TodoModel> _todoModelList;

  @override
  void initState() {
    super.initState();
    _todoModelList = new List<TodoModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add),
            onPressed: () {
              _addTodoModel(context);
            },
          )
        ],
      ),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    if (_todoModelList == null || _todoModelList.length == 0) {
      return Text('in todo');
    } else {
      return ListView.builder(
        itemCount: _todoModelList.length,
        itemBuilder: (BuildContext context, int index) {
          assert(index >= 0 && _todoModelList.length > index,
              'index out of _todoModelList.length');
          TodoModel _tmp = _todoModelList[index];
          return Card(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'index ${_tmp.name}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${_tmp.description}',
                      style: TextStyle(color: Colors.grey),
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
      Navigator.pushNamed(context, '/todo/add').then((value) {
        assert(value is TodoModel, 'value is not TodoModel');
        assert(_todoModelList != null, '_todoModelList is null');
        print('add todo model $value');
        setState(() {
          _todoModelList.add(value as TodoModel);
        });
      });
  }
}
