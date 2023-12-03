import 'package:flutprojs/task_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "notes_database.db";
  static const _databaseVersion = 1;

  static const table = 'notes_table';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnFinished = 'finished';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnFinished INTEGER NOT NULL
          )
          ''');
  }

  // Future<void> insertTask(TaskInfo task) async {
  //   // Get a reference to the database.
  //   final db = await database;
  //   // Insert the Task into the correct table.
  //   await db.insert(
  //     'tasks',
  //     task.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
  //
  // Future<List<TaskInfo>> tasks() async {
  //   // Get a reference to the database.
  //   final db = await database;
  //
  //   // Query the table for all tasks.
  //   final List<Map<String, dynamic>> maps = await db.query('tasks');
  //
  //   // Convert the List<Map<String, dynamic> into a List<TaskInfo>.
  //   return List.generate(maps.length, (i) {
  //     return TaskInfo(
  //       taskId: maps[i]['taskId'],
  //       taskName: maps[i]['taskName'],
  //       taskFinished: maps[i]['taskFinished'] == 1,
  //     );
  //   });
  // }
}
