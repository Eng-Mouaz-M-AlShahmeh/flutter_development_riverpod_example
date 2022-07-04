/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';

class TodosNotifier extends ChangeNotifier {
  // TODO: add program to your app as you want
  // initialize data
  TodoModel? selectedTodo;
  final todos = <TodoModel?>[];
  String title = '';
  String dsc = '';

  // functions
  void setTitle(String val) {
    title = val;
    notifyListeners();
  }

  void setDsc(String val) {
    dsc = val;
    notifyListeners();
  }

  void selectTodo(TodoModel todo) {
    selectedTodo = todo;
    notifyListeners();
  }

  void addTodo(TodoModel todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int todoId) {
    todos.remove(todos.firstWhere((element) => element!.id == todoId));
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    todos[todos.indexWhere((element) => element!.id == todo.id)] = todo;
    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
