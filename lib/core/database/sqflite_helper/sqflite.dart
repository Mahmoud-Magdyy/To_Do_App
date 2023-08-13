import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/features/task/data/mode/task_model.dart';

class SqfliteHelper {
  late Database db;

  //! initDatabase
  void initDB() async {
    //create db
    await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (Database db, int v) async {
        //create table
        await db.execute('''
          CREATE TABLE Tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            note TEXT,
            date TEXT,
            startTime TEXT,
            endTime TEXT,
            color INTEGER,
            isCompleted INTEGER
          )
        ''').then(
          (value) => print('DB created successfully'),
        );
      },
      onOpen: (db) => print('DB opened '),
    ).then((value) => db = value).catchError(
      (e) {
        print(e.toString());
      },
    );  
    
  }

  //! get
  Future<List<Map<String, dynamic>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

  //! insert
  Future<int> inserrToDB(TaskModel model) async {
    print('insert loading');
    return await db.rawInsert('''
        INSERT INTO Tasks(title,note,date,startTime,endTime,color,isCompleted)VALUES
        ('${model.title}','${model.note}','${model.date}','${model.startTime}',
        '${model.endTime}','${model.color}','${model.isCompleted}')
      ''');
      
  }

  //! update
  Future<int> updateDB(int id) async {
    return await db
        .rawUpdate('UPDATE Tasks SET isCompleted = ?  WHERE id = ?', [1, id]);
  }

  //! delete
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]);
  }
}
