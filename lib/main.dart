import 'package:flutprojs/new_task_screen.dart';
import 'package:flutprojs/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskList()..loadTasks(),
      child: const MaterialApp(
        title: 'Notes App',
        home: NotesHomePage(title: 'my notes app'),
      ),
    );
  }
}

class NotesHomePage extends StatelessWidget {
  const NotesHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Consumer<TaskList>(
        builder: (context, taskList, child) {
          return ListView.builder(
            itemCount: taskList.tasks.length,
            itemBuilder: (context, index) {
              final task = taskList.tasks[index];
              return ListTile(
                title: Text(
                  task.taskName,
                  style: TextStyle(
                    decoration:
                        task.taskFinished ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Checkbox(
                  value: task.taskFinished,
                  onChanged: (newValue) async {
                    task.taskFinished = newValue!;
                    await taskList.finishTask(task);
                  },
                ),
                onLongPress: () async {
                  await taskList.removeTask(task);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task removed'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
