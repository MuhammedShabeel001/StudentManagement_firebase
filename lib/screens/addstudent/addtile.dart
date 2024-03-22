import 'dart:io';

import 'package:firebase_app/screens/addstudent/add_student.dart';
import 'package:firebase_app/screens/common/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Addtile extends StatefulWidget {
  const Addtile({super.key});

  @override
  State<Addtile> createState() => _AddtileState();
}

class _AddtileState extends State<Addtile> {
  @override
  void initState() {
    setState(() {
      // image1 = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(155, 181, 161, 1),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          controller: namecontroller,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20)
                          ],
                          decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(66, 71, 67, 1)),
                              suffixIconColor:
                                  Color.fromRGBO(66, 71, 67, 1),
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              labelText: ' Name'),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter age';
                            }
                            return null;
                          },
                          controller: agecontroller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                          decoration: const InputDecoration(
                              suffixIconColor:
                                  Color.fromRGBO(66, 71, 67, 1),
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(66, 71, 67, 1)),
                              suffixIcon: Icon(Icons.date_range),
                              border: OutlineInputBorder(),
                              labelText: ' Age'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                          controller: phonecontroller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: const InputDecoration(
                            suffixIconColor: Color.fromRGBO(66, 71, 67, 1),
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(66, 71, 67, 1)),
                            suffixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            labelText: ' Phone Number',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter place';
                            }
                            return null;
                          },
                          controller: placecontroller,
                          decoration: const InputDecoration(
                              suffixIconColor:
                                  Color.fromRGBO(66, 71, 67, 1),
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(66, 71, 67, 1)),
                              suffixIcon: Icon(Icons.place),
                              border: OutlineInputBorder(),
                              labelText: ' Place'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              addstudent(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(59, 123, 122, 1)),
                            child: const Text(
                              'Add student',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // option() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //         backgroundColor: Color.fromRGBO(59, 123, 122, 1),
  //         content: const Text(
  //           'Photo options',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         actions: [
  //           TextButton(
  //               onPressed: () {
  //                 fromcamera();
  //               },
  //               child: const Text(
  //                 'Camera',
  //                 style: TextStyle(color: Colors.white),
  //               )),
  //           TextButton(
  //             onPressed: () {
  //               fromgallery();
  //             },
  //             child: const Text(
  //               'Gallery',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  }