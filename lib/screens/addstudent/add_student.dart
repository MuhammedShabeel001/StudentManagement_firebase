import 'dart:io';

import 'package:firebase_app/screens/addstudent/addtile.dart';
import 'package:flutter/material.dart';

File? image1;
String? image;
final GlobalKey<FormState> formkey = GlobalKey<FormState>();

final namecontroller = TextEditingController();

final agecontroller = TextEditingController();

final phonecontroller = TextEditingController();

final placecontroller = TextEditingController();

class Studentadd extends StatefulWidget {
  const Studentadd({super.key});

  @override
  State<Studentadd> createState() => _StudentaddState();
}

class _StudentaddState extends State<Studentadd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 123, 122, 1),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(21),
            child: Text(
              'Please enter details',
              style: TextStyle(
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontWeight: FontWeight.w300),
            ),
          ),
          ),
      body: const Addtile(),
    );
  }
}
