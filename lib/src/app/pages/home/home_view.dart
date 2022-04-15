import 'package:clean_architecture_01/src/app/pages/home/home_controller.dart';
import 'package:clean_architecture_01/src/data/repositories/data_todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(
      HomeController(DataTodoRepository()),
    );
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);
  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      body: Column(
        children: [],
      ),
    );
  }
}
