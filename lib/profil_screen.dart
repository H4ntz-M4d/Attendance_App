import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance_app/models/profil_item.dart';
import 'package:attendance_app/widgets/widgets_list.dart';

class ProfilLayout extends StatefulWidget{
  const ProfilLayout({super.key});
  
  @override
  State<ProfilLayout> createState() {
    return _ProfilLayout();
  }
}

class _ProfilLayout extends State<ProfilLayout>{

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: Text(
          'Profil',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              buildEditImage(),
              const Column(children: [
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'NIM',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)
                  ),
                  child: Text(
                    '123456',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                )

              ],)
            ],
          ),
        ),
      ),
    );
  }
}