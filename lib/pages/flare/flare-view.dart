import 'package:albacore/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareView extends StatefulWidget {
  @override
  _FlareViewState createState() => new _FlareViewState();
}

class _FlareViewState extends State<FlareView> {
  String _animationName = 'fail';

  @override
    Widget build(BuildContext context) {
        return new Scaffold(
            backgroundColor: Colors.grey,
            appBar: new AppBar(title: new Text('Flare View')),
            drawer: Utils.generateDrawer(context),
            body: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: 
                    [
                        Expanded(
                            child: FlareActor('animations/Teddy.flr',
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: _animationName,
                            )
                        )
                    ],
                ),
            )
        );
    }
}