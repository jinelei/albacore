import 'package:albacore/bloc/bloc_provider.dart';
import 'package:albacore/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class SliderDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final HomeBloc _homeBloc = BlocProvider.of(context);
    return Drawer(
      child: ListView(children: <Widget>[
        ListTile(
          leading: Icon(Icons.home),
          title: Text('首页'),
          onTap: () {
            _homeBloc.updateTitle("test tap");
            Navigator.pop(context);
          },
        )
      ],),
    );
  }

}