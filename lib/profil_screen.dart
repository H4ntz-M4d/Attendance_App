import 'package:attendance_app/edit_screen.dart';
import 'package:attendance_app/models/profil_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance_app/widgets/widgets_list.dart';

class ProfilLayout extends StatefulWidget{
  const ProfilLayout({super.key});
  
  @override
  State<ProfilLayout> createState() {
    return _ProfilLayout();
  }
}


class _ProfilLayout extends State<ProfilLayout>{
  final List<ProfilItem> _editingProfil = [];

  String name = ''; // Tambahkan variabel name
  String phone = ''; // Tambahkan variabel phone

  void _openEditOverlay() {
    showModalBottomSheet(
      context: context, 
      builder: (ctx){
        return EditScreen(editProfile: _editProfil);
      }
    );
  }

  void _editProfil(ProfilItem item){
    setState(() {
      _editingProfil.add(item);
      name = item.name;
      phone = item.noHp;
    });
  }

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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 300,
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                buildEditImage(),
                const SizedBox(height: 35,),
                
                buildColumnProfil(name, phone),
                const SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: _openEditOverlay, 
                  child: const Text('Edit'))
                ],
            ),
          ),
        ),
      ),
    );
  }
}