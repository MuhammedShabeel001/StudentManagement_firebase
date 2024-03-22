import 'package:firebase_app/db/db_functions.dart';
import 'package:firebase_app/db/db_model.dart';
import 'package:firebase_app/screens/addstudent/add_student.dart';
import 'package:firebase_app/screens/liststudent/list_student.dart';
import 'package:flutter/material.dart';


snackbar(text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color.fromARGB(255, 63, 62, 62),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    ),
  ));
}

Future<void> addstudent(BuildContext context) async {
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  
    
    snackbar('Submitted', context);

   Navigator.of(context).pop();

  if (formkey.currentState!.validate() ) {
    addfirebase();
    final studentvalues = StudentModel(
      name: name,
      age: age,
      phone: phone,
      place: place,
      // image: image!,
    );
    await addStudents(studentvalues);
    await clearcontroller();
    
    // ignore: use_build_context_synchronously
   

    // ignore: use_build_context_synchronously
    
  } 
}

clearcontroller() {
  namecontroller.text = '';
  agecontroller.text = '';
  phonecontroller.text = '';
  placecontroller.text = '';
}

addfirebase() {
  final data = {
    
    'Name': namecontroller.text,
    'Age': agecontroller.text,
    'Phone Number': phonecontroller.text,
    'Place': placecontroller.text,
  };
  firedata.add(data);
}
