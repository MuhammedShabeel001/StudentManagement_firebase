import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  // final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldkey,
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
            onPressed: (){}, 
            icon:const Icon(Icons.menu_rounded,
            color: Color.fromRGBO(234, 228, 196, 1),)),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon:const Icon(
              Icons.search_rounded,
              color:  Color.fromRGBO(234, 228, 196, 1),))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(66, 71, 67, 1),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor:const Color.fromRGBO(59, 123, 122, 1),
        child:const Icon(Icons.add,color: Color.fromRGBO(234, 228, 196, 1),),),
      body: SafeArea(
        
        child: SizedBox(),),
    );
  }
}