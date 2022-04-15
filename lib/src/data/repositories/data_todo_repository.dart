import 'dart:async';

import 'package:clean_architecture_01/src/domain/entities/todo_model.dart';
import 'package:clean_architecture_01/src/domain/repositories/todo_repository.dart';

class DataTodoRepository implements TodoRepository {
  static final _instance = DataTodoRepository._internal();
  DataTodoRepository._internal();
  factory DataTodoRepository() => _instance;

  StreamController<List<TodoModel>> _streamController =
      StreamController.broadcast();

  List<TodoModel> _todos = [TodoModel("id", "title", "description")];
  @override
  Stream<List<TodoModel>> getTodos() {
    _initTodos();

    return _streamController.stream;
  }

  void _initTodos() {
    Future.delayed(Duration.zero).then((_) => _streamController.add(_todos));
  }
}
