import 'package:firebase_app/db/db_model.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initializingDatabase() async{
  _db = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (Database db,int version) {
      db.execute(
        'CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, age TEXT, phone TEXT, place TEXT ,image TEXT)'
      );
    } ,
  );
}

Future<void> addStudents(StudentModel value)async{
  await _db.execute(
    'INSERT INTO student(name, age, phone, place, image)VALUES(?,?,?,?,?)',
    [value.name, value.age, value.phone, value.place, value.image]
  );
  getAllStudent();
} 

Future<void> getAllStudent() async{
  final _values = await _db.rawQuery('SELECT * FROM student');
  studentListNotifier.value.clear();

  _values.forEach((map) { 
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
  });

  studentListNotifier.notifyListeners();
}

Future<void> updateStudent(int id, String name, String age, String phone, String place, String image) async{
  final data = {
    'name': name,
    'age': age,
    'phone': phone,
    'place': place,
    'image': image,
  };

  await _db.update('student', data, where: 'id=?', whereArgs: [id]);
  getAllStudent();
}

Future<void> deleteStudent(int id) async{
  await _db.delete('student', where: 'id=?', whereArgs: [id]);
  getAllStudent();
}