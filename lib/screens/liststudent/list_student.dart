import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/db/db_model.dart';
import 'package:firebase_app/screens/liststudent/listTile.dart';
import 'package:flutter/material.dart';


class Liststudent extends StatefulWidget {
  const Liststudent({super.key});

  @override
  State<Liststudent> createState() => _ListstudentState();
}

final CollectionReference firedata = FirebaseFirestore.instance.collection('StudentModel');

class _ListstudentState extends State<Liststudent> {
  late StudentModel student;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firedata.snapshots(),
        builder: (ctx, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final DocumentSnapshot data = snapshot.data.docs[index];

                    return Listtile(
                      data: data,
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 1,
                    );
                  },
                  itemCount: snapshot.data!.docs.length),
            );
          } else {
            return const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        }
      );
  }
}
