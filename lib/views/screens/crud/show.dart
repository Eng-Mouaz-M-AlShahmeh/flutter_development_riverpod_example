/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/controllers/todo_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';
import 'package:riverpod_example/views/screens/crud/list.dart';
import 'package:riverpod_example/views/widgets/button.dart';
import 'package:riverpod_example/views/widgets/text_form_field.dart';

class ShowTodo extends ConsumerWidget {
  const ShowTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoModel todo = ref.read(todosProvider).selectedTodo!;

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
        title: Text(todo.title!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              iTextFormFieldReadOnly(
                context,
                'Todo Text',
                'Enter Todo Text',
                Icons.title,
                (val) => null,
                titleController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              iTextFormFieldReadOnly(
                context,
                'Todo Dsc',
                'Enter Todo Dsc',
                Icons.description,
                (val) => null,
                dscController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              iOutlinedButtonNoKey(context, 'Return To List', () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const TodoList()));
              }),
            ],
          ),
        ),
      ),
    ));
  }
}
