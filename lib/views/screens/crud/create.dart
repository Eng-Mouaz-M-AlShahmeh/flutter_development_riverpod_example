/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/controllers/todo_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';
import 'package:riverpod_example/views/screens/crud/list.dart';
import 'package:riverpod_example/views/widgets/button.dart';
import 'package:riverpod_example/views/widgets/text_form_field.dart';

// Todo: extend consumer widget
class CreateTodo extends ConsumerWidget {
  CreateTodo({Key? key}) : super(key: key);

  final _createKey = GlobalKey<FormState>();

  @override
  // Todo: add widget ref in build parameters
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: if you do not need listen always you can use read
    String title = ref.read(todosProvider).title;
    String dsc = ref.read(todosProvider).dsc;

    final TextEditingController titleController =
        TextEditingController(text: title);
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: title.length,
        ),
      ),
    );

    final TextEditingController dscController =
        TextEditingController(text: dsc);
    dscController.value = dscController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: dsc.length,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _createKey,
            child: Column(
              children: [
                iTextFormField(
                    context,
                    'Todo Text',
                    'Enter Todo Text',
                    Icons.title,
                    // TODO: if you do not need listen always you can use read
                    (val) => ref.read(todosProvider.notifier).setTitle(val),
                    titleController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormField(
                    context,
                    'Todo Dsc',
                    'Enter Todo Dsc',
                    Icons.description,
                    // TODO: if you do not need listen always you can use read
                    (val) => ref.read(todosProvider.notifier).setDsc(val),
                    dscController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _createKey, 'Add Todo', () {
                  // TODO: if you do not need listen always you can use read
                  // TODO: if you need listen always you can use watch
                  ref.read(todosProvider.notifier).addTodo(TodoModel(
                      id: DateTime.now().microsecond,
                      title: ref.watch(todosProvider).title,
                      dsc: ref.watch(todosProvider).dsc));
                  ref.read(todosProvider.notifier).setTitle('');
                  ref.read(todosProvider.notifier).setDsc('');
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
