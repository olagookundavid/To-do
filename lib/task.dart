class Task {
  final String name;
  bool isdone = false;
  Task(this.name, this.isdone);
  void toggleDone() {
    isdone = !isdone; 
  }
}
