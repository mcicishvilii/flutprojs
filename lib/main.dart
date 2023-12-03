import 'package:flutprojs/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutprojs/new_task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Notes App',
      home: NotesHomePage(title: 'my notes app'),
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
                title: Text(task.taskName),
                trailing: Checkbox(
                  value: task.taskFinished,
                  onChanged: (newValue) {
                    task.taskFinished = newValue!;
                  },
                ),
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
        backgroundColor: Colors.green,
      ),
    );
  }
}
