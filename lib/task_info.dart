class TaskInfo {
  final int taskId;
  final String taskName;
  bool taskFinished;

  TaskInfo({required this.taskId, required this.taskName, this.taskFinished = false});
  void updateTaskFinished(bool newValue) {
    taskFinished = newValue;
  }

  // Convert a TaskInfo object into a map.
  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'taskName': taskName,
      'taskFinished': taskFinished ? 1 : 0,
    };
  }
}