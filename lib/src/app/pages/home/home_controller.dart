import 'package:clean_architecture_01/src/app/pages/home/home_presenter.dart';
import 'package:clean_architecture_01/src/domain/entities/todo_model.dart';
import 'package:clean_architecture_01/src/domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(TodoRepository _todoRepository)
      : _presenter = HomePresenter(_todoRepository);

  List<TodoModel>? todos;
  @override
  void onInitState() {
    _presenter.getTodos();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getTodosOnNext = (List<TodoModel>? response) {
      todos = response;
      refreshUI();
    };

    _presenter.getTodosOnError = (e) {};
  }

  void removeTodo(String toDoId) {
    _presenter.removeTodo(toDoId);
    refreshUI();
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
