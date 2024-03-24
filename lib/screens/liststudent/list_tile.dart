import 'package:firebase_app/db/model/db_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listtile extends StatelessWidget {
  Listtile({super.key, required this.data});
   Studentmodel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(155, 181,161, 1),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Name : ${data.name}',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Age : ${data.age}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                Text(
                  'Phone : ${data.phone}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                Text(
                  'Place : ${data.place}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
