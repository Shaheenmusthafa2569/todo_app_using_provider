class Task {
  final String titles;
  bool isDone; //to show if the task is done or not
  Task({required this.titles, this.isDone = false}); //starts with task not done

  void toggleDone() {
    isDone = !isDone;
  }
}
