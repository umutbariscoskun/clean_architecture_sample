import 'package:clean_architecture_01/src/app/pages/home/home_presenter.dart';
import 'package:clean_architecture_01/src/domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(TodoRepository _todoRepository)
      : _presenter = HomePresenter(_todoRepository);
  @override
  void initListeners() {}
}
