import 'package:clean_architecture_01/src/domain/entities/todo_model.dart';
import 'package:clean_architecture_01/src/domain/repositories/todo_repository.dart';

class DataTodoRepository implements TodoRepository {
  @override
  Stream<List<TodoModel>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }
}
