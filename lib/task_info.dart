class TaskInfo {
  final int taskId;
  final String taskName;
  bool taskFinished;

  TaskInfo(
      {required this.taskId,
      required this.taskName,
      this.taskFinished = false});

  void updateTaskFinished(bool newValue) {
    taskFinished = newValue;
  }

    Map<String, dynamic> toMap() {
    return {
      'id': taskId,
      'name': taskName,
      'finished': taskFinished ? 1 : 0,
    };
  }
}
