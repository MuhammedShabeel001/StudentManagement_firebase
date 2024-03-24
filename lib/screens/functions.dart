import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/db/model/db_model.dart';
import 'package:firebase_app/screens/addstudent/add_student.dart';
import 'package:flutter/material.dart';
snackbar(text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor:const Color.fromARGB(255, 63, 62, 62),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    ),
  ));
}

ValueNotifier<List<Studentmodel>> studentlistNotifier = ValueNotifier([]);

Future<void> addstudent(BuildContext context) async {
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  if (formkey.currentState!.validate()) {
    try {
      await FirebaseFirestore.instance.collection('students').add({
        'name': name,
        'age': age,
        'phone': phone,
        'place': place,
      });

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(); // Close the add student screen
      clearcontroller(); // Clear text controllers
      // ignore: use_build_context_synchronously
      snackbar('Submitted', context); // Show success message
    } catch (e) {
      // ignore: use_build_context_synchronously
      snackbar('Failed to add student', context); // Show error message
      // print('Error adding student: $e');
    }
  } else {
    snackbar('Please fill in all fields', context); // Show validation error message
  }
}


Stream<List<Studentmodel>> getStudentsStream() {
    return FirebaseFirestore.instance
        .collection('students')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Studentmodel.fromMap(doc.data())).toList());
  }

clearcontroller() {
  namecontroller.text = '';
  agecontroller.text = '';
  phonecontroller.text = '';
  placecontroller.text = '';
}



