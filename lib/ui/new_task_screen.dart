import 'package:flutprojs/data/db/task_info.dart';
import 'package:flutprojs/data/db/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(
                labelText: 'Task name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final taskName = _taskNameController.text;
                if (taskName.isNotEmpty) {
                  final task = TaskInfo(
                      taskId: DateTime.now().millisecondsSinceEpoch,
                      taskName: taskName,
                      taskFinished: false);
                  Provider.of<TaskList>(context, listen: false).add(task);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
