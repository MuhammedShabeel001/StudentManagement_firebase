import 'package:firebase_app/screens/addstudent/add_student.dart';
import 'package:firebase_app/screens/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Addtile extends StatefulWidget {
  const Addtile({super.key});

  @override
  State<Addtile> createState() => _AddtileState();
}

class _AddtileState extends State<Addtile> {
  @override

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
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
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              suffixIconColor:
                                  Color.fromRGBO(59, 123, 122, 1),
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              labelText: ' Name'),
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                                   Color.fromRGBO(59, 123, 122, 1),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
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
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                            suffixIconColor: Color.fromRGBO(59, 123, 122, 1),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
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
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter place';
                            }
                            return null;
                          },
                          controller: placecontroller,
                          decoration: const InputDecoration(
                              suffixIconColor:
                                  Color.fromRGBO(59, 123, 122, 1),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
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
                              // clearcontroller();
                             addstudent(context);
                              
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(59, 123, 122, 1)),
                            child: const Text(
                              'Add studdent',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
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

}