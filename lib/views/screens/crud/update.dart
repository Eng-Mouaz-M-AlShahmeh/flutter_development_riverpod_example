/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/controllers/todo_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';
import 'package:riverpod_example/views/screens/crud/list.dart';
import 'package:riverpod_example/views/widgets/button.dart';
import 'package:riverpod_example/views/widgets/text_form_field.dart';

class UpdateTodo extends ConsumerWidget {
  UpdateTodo({Key? key}) : super(key: key);

  final _updateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoModel todo = ref.watch(todosProvider).selectedTodo!;

    final TextEditingController titleController =
        TextEditingController(text: todo.title);
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todo.title!.length,
        ),
      ),
    );

    final TextEditingController dscController =
        TextEditingController(text: todo.dsc);
    dscController.value = dscController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todo.dsc!.length,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _updateKey,
            child: Column(
              children: [
                iTextFormField(
                  context,
                  'Todo Text',
                  'Enter Todo Text',
                  Icons.title,
                  (val) => ref.read(todosProvider).selectTodo(TodoModel(
                        id: todo.id,
                        title: val,
                        dsc: todo.dsc,
                      )),
                  titleController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormField(
                  context,
                  'Todo Dsc',
                  'Enter Todo Dsc',
                  Icons.description,
                  (val) => ref.read(todosProvider).selectTodo(TodoModel(
                        id: todo.id,
                        title: todo.title,
                        dsc: val,
                      )),
                  dscController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _updateKey, 'Update Todo', () {
                  ref.read(todosProvider).updateTodo(TodoModel(
                        id: todo.id,
                        title: todo.title,
                        dsc: todo.dsc,
                      ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoList()));
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
