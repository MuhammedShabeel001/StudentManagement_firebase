// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/db/db_functions.dart';
import 'package:firebase_app/db/db_model.dart';
import 'package:firebase_app/screens/common/functions.dart';
import 'package:firebase_app/screens/editstudent/edit_student.dart';
import 'package:firebase_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';


class EditTile extends StatefulWidget {
  const EditTile({super.key, required this.studentdetails});
  final StudentModel studentdetails;
  @override
  State<EditTile> createState() => _EditTileState();
}

class _EditTileState extends State<EditTile> {
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  @override
  void initState() {
    namecontrollers.text = widget.studentdetails.name;
    agecontrollers.text = widget.studentdetails.age;
    phonecontrollers.text = widget.studentdetails.phone;
    placecontrollers.text = widget.studentdetails.place;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(251, 23, 22, 22),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: key2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            controller: namecontrollers,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15)
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 216, 212, 212)),
                              ),
                              labelText: 'Name',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                            ],
                            controller: agecontrollers,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter age';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.date_range),
                              border: OutlineInputBorder(),
                              labelText: 'Age',
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.phone,
                            controller: phonecontrollers,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                              labelText: 'Phone no',
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            controller: placecontrollers,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter place';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.place),
                              border: OutlineInputBorder(),
                              labelText: 'place',
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                update(context, widget.studentdetails.id,
                                    context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 240, 187, 30)),
                              child: const Text(
                                'Update',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              )),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> update(ctx, id, context,) async {
    final name = namecontrollers.text.trim();
    final age = agecontrollers.text.trim();
    final phone = phonecontrollers.text.trim();
    final place = placecontrollers.text.trim();

    if (key2.currentState!.validate()) {
      await updateStudent(
        id,
        name,
        age,
        phone,
        place,
       
      );
      clearcontroller();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return const ScreenHome();
      }));

      snackbar('Updated', context);
    }
  }
}
