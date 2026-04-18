class Task {
  final String title;
  bool isDone; //to show if the task is done or not
  Task({required this.title, this.isDone = false}); //starts with task not done

  void toggleDone() {
    isDone = !isDone;
  }
}
