import 'package:flutter/material.dart';
import 'package:todo_app_using_provider/model/model.dart';

class Controller extends ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  bool? get isDone => null;
  void addTask(String title) {
    _tasks.add(Task(titles: title));
    notifyListeners();
  }

  void toggleDonee(Task checkdone) {
    checkdone.toggleDone();
    notifyListeners();
  }

  void toggledelete(Task deletetask) {
    _tasks.remove(deletetask);
    notifyListeners();
  }
}
