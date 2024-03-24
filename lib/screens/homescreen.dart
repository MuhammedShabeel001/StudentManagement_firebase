
import 'package:firebase_app/screens/addstudent/add_student.dart';
import 'package:firebase_app/screens/functions.dart';
import 'package:firebase_app/screens/liststudent/list_student.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(59, 123, 122, 1),
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'STUDENTS',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                clearcontroller();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) {
                  return
                   const Studentadd();
                }));
              },
              backgroundColor:const Color.fromRGBO(59, 123, 122, 1),
              child:const Icon(Icons.add,color: Colors.white,),),
        body:const SafeArea(
            child:  Liststudent()));
  }
}
