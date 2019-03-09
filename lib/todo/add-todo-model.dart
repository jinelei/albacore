import "package:flutter/material.dart";
import 'package:albacore/todo/todo-model.dart';
import 'package:intl/intl.dart';


class AddTodoView extends StatefulWidget {
  @override
  createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodoView> {
  TextEditingController _nameController;
  TextEditingController _descriptionController;
  FocusNode _nameFocusNode;
  FocusNode _descriptionFocusNode;
  String nameErrorText;
  String descriptionErrorText;
  TodoModel _todoModel;
  bool _confirmEnabled;
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String message) {
    var snackBar = SnackBar(content: Text(message));
    _scaffoldkey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    _todoModel = new TodoModel(null, null, finished: false, startTime: DateTime.now(), endTime: DateTime.now());
    _confirmEnabled = false;
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("add todo model"),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.check),
            onPressed: () {
              _confirmAddTodoModel(context);
            },
          )
        ],
      ),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Column(
      children: <Widget>[
        TextField(
          controller: _nameController,
          focusNode: _nameFocusNode,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              icon: Icon(Icons.note_add),
              labelText: '名称',
              errorText: nameErrorText,
              errorStyle: TextStyle(color: Colors.red),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
          onChanged: _nameChanged,
          autofocus: true,
        ),
        TextField(
          controller: _descriptionController,
          focusNode: _descriptionFocusNode,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              icon: Icon(Icons.note_add),
              labelText: '描述',
              errorText: descriptionErrorText,
              errorStyle: TextStyle(color: Colors.red),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
          onChanged: _descriptionChanged,
          autofocus: true,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              OutlineButton(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text("${DateFormat("yy-MM-dd hh:mm").format(_todoModel.startTime)}"),
              ), onPressed: () {_clickStartTime();},),
              OutlineButton(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                child: Text("${DateFormat("yy-MM-dd hh:mm").format(_todoModel.endTime)}"),
              ), onPressed: () {_clickEndTime();},),
            ],
          ),
        ),
      ],
    );
  }

  /// 添加TodoModel
  void _confirmAddTodoModel(BuildContext context) {
    assert(_nameFocusNode != null, "_nameFocusNode is null");
    assert(_descriptionFocusNode != null, "_descriptionFocusNode is null");
    if (_nameFocusNode.hasFocus) {
      _nameFocusNode.unfocus();
    }
    if (_descriptionFocusNode.hasFocus) {
      _descriptionFocusNode.unfocus();
    }
    if (_confirmEnabled) {
      Navigator.pop(context, new TodoModel("test", "test desctiption"));
    } else {
      showSnackBar("请检查输入条件");
    }
  }

  /// 名称改变监听
  void _nameChanged(String value) {
    print("name changed $value");
    if (value != null && value.length != 0) {
      _todoModel.name = value;
      _todoModel.description = value;
      _descriptionController.value = TextEditingValue(text: value);
    }
  }

  /// 描述改变监听
  void _descriptionChanged(String value) {
    print("description changed $value");
    if (value != null && value.length != 0) {
      _todoModel.description = value;
    }
  }

  Future _clickStartTime() async {
    DateTime tmpDateTime = await showDatePicker(
        context: context,
        initialDate: _todoModel.endTime,
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020));
    if (tmpDateTime != null) {
      setState(() {
        this._todoModel.startTime = tmpDateTime;
        if (tmpDateTime.isAfter(this._todoModel.endTime))
          this._todoModel.endTime = tmpDateTime.add(Duration(days: 1));
      });
    }
  }
  Future _clickEndTime() async {
    DateTime tmpDateTime = await showDatePicker(
        context: context,
        initialDate: _todoModel.endTime,
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020));
    if (tmpDateTime != null) {
      setState(() {
        this._todoModel.endTime = tmpDateTime;
        if (tmpDateTime.isBefore(this._todoModel.startTime))
          this._todoModel.startTime = tmpDateTime.add(Duration(days: -1));
      });
    }
  }
}
