import 'package:clean_architecture_01/src/app/pages/add_todo.dart/add_todo_controller.dart';
import 'package:clean_architecture_01/src/data/repositories/data_todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddTodoView extends View {
  @override
  State<StatefulWidget> createState() {
    return _AddTodoViewState(AddTodoController(DataTodoRepository()));
  }
}

class _AddTodoViewState extends ViewState<AddTodoView, AddTodoController> {
  _AddTodoViewState(AddTodoController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      key: globalKey,
      body: ControlledWidgetBuilder<AddTodoController>(
        builder: (context, controller) {
          return Padding(
            padding: PagePadding.horizontal(),
            child: Column(
              children: [
                SizedBox(height: padding.top),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Title"),
                  ),
                  onChanged: (value) =>
                      controller.onTitleTextFieldChanged(value),
                ),
                TextFormField(
                  onChanged: (value) =>
                      controller.onDescriptionTextFieldChanged(value),
                  decoration: InputDecoration(
                    label: Text("Description"),
                  ),
                ),
                TextFormField(
                  onChanged: (value) =>
                      controller.onImageUrlTextFieldChanged(value),
                  decoration: InputDecoration(
                    label: Text("ImageUrl"),
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () => controller.onAddButtonPressed(),
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.blue,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
  const PagePadding.horizontal() : super.symmetric(horizontal: 17);
}
