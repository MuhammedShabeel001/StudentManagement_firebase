import 'package:firebase_app/screens/addstudent/add_student.dart';
import 'package:firebase_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        centerTitle: true ,
        backgroundColor:const Color.fromRGBO(59, 123, 122, 1),
        title: const Text(
          'WELCOME',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(234, 228, 196, 1)
          ),
        ),
        leading: SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            onPressed: (){
              _scaffoldkey.currentState!.openDrawer();
            }, 
            icon:const Icon(Icons.menu_rounded,
            color: Color.fromRGBO(234, 228, 196, 1),)),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon:const Icon(
              Icons.search_rounded,
              color:  Color.fromRGBO(234, 228, 196, 1),
            )
          )
        ],
      ),
      drawer:const Drawer(
        elevation: 10,
        backgroundColor: Color.fromRGBO(59, 123, 122, 1),
        child: settingsDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Studentadd(),));
        },
        backgroundColor:const Color.fromRGBO(59, 123, 122, 1),
        child:const Icon(Icons.add,color: Color.fromRGBO(234, 228, 196, 1),),),
      body: SafeArea(
        
        child: SizedBox(),),
    );
  }
}