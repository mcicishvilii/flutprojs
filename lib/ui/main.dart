import 'package:flutprojs/ui/next_screen.dart';
import 'package:flutprojs/ui/new_task_screen.dart';
import 'package:flutprojs/data/db/task_list.dart';
import 'package:flutprojs/ui/test_widgets_screen.dart';
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
        debugShowCheckedModeBanner: false,
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
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  tileColor: task.taskFinished ? Colors.green[100] : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 8.0),
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
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            right: 00.0,
            bottom: 10.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewTaskScreen()),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            left: 30.0,
            bottom: 10.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestWidgetsScreen(),
                  ),
                );
              },
              child: const Text("test"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NextScreen()),
            );
          },
          child: const Text("Go To api call"),
        ),
      ),
    );
  }
}
