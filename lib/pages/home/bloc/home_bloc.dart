import 'dart:async';

import 'package:albacore/bloc/bloc_provider.dart';

class HomeBloc implements BlocBase {
  StreamController<String> _titleController = StreamController<String>.broadcast();
  Stream<String> get title => _titleController.stream;

  @override
  void dispose() {
    _titleController.close();
  }

  void updateTitle(String title){
    _titleController.sink.add(title);
  }

}

enum FILTER_STATUS { BY_TODAY, BY_WEEK, BY_PROJECT, BY_LABEL, BY_STATUS }