import 'dart:async';

import 'package:clean_architecture_01/src/domain/entities/todo_model.dart';
import 'package:clean_architecture_01/src/domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetTodos extends UseCase<List<TodoModel>, void> {
  final TodoRepository _todoRepository;
  final StreamController<List<TodoModel>> _controller;

  GetTodos(
    this._todoRepository,
  ) : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<TodoModel>?>> buildUseCaseStream(void params) async {
    try {
      _todoRepository.getTodos().listen((List<TodoModel> contacts) {
        if (!_controller.isClosed) _controller.add(contacts);
      });
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      _controller.addError(error, stackTrace);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
