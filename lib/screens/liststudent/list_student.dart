import 'package:firebase_app/db/model/db_model.dart';
import 'package:firebase_app/screens/functions.dart';
import 'package:firebase_app/screens/liststudent/list_tile.dart';
import 'package:flutter/material.dart';

class Liststudent extends StatefulWidget {
  const Liststudent({super.key});

  @override
  State<Liststudent> createState() => _ListstudentState();
}

class _ListstudentState extends State<Liststudent> {
  late Stream<List<Studentmodel>> _studentsStream;

  @override
  void initState() {
    super.initState();
    _studentsStream = getStudentsStream();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _studentsStream, 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshot.hasError){
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }else{
          List<Studentmodel>students = snapshot.data ?? [];
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Listtile(data: student);
            },);
        }
      },);
  }
}
