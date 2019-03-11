import 'package:flutter/material.dart';

class Utils {
  static Widget generateDrawer(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        children: <Widget>[
          ListTile(leading: Icon(Icons.home), title: Text("Todo"),onTap: (){
            Navigator.of(context).pushReplacementNamed("/todo");
          },),
          ListTile(leading: Icon(Icons.more),title: Text("Flare"),onTap: (){
            Navigator.of(context).pushReplacementNamed("/flare");
          },)
        ],
      )
    );
  }
}
