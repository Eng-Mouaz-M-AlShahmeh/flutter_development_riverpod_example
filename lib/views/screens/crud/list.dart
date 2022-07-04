/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/controllers/todo_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';
import 'package:riverpod_example/views/screens/crud/create.dart';
import 'package:riverpod_example/views/screens/crud/show.dart';
import 'package:riverpod_example/views/screens/crud/update.dart';

// Todo: extend consumer widget
class TodoList extends ConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  // Todo: add widget ref in build parameters
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: if you need listen always you can use watch
    List<TodoModel?> todos = ref.watch(todosProvider).todos;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Todos\' List'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: todos.isNotEmpty ? todos.length : 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index]!.title!),
              subtitle: Text(todos[index]!.dsc!),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            // TODO: if you do not need listen always you can use read
                            ref
                                .read(todosProvider.notifier)
                                .selectTodo(todos[index]!);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateTodo()));
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            // TODO: if you do not need listen always you can use read
                            ref
                                .read(todosProvider.notifier)
                                .selectTodo(todos[index]!);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ShowTodo()));
                          },
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
              ),
              leading: InkWell(
                  onTap: () {
                    // TODO: if you do not need listen always you can use read
                    ref
                        .read(todosProvider.notifier)
                        .removeTodo(todos[index]!.id!);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CreateTodo()));
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
