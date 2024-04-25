import 'package:attendance_app/widgets/edit_Photo.dart';
import 'package:attendance_app/widgets/edit_screen.dart';
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

  String _alamat = ''; // Tambahkan variabel name
  String _phone = ''; // Tambahkan variabel phone

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
      _alamat = item.alamat;
      _phone = item.noHp;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Container(
              width: 300,
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const BuildEditImage(),
                  const SizedBox(height: 35,),
                  
                  buildColumnProfil(_alamat, _phone),
                  const SizedBox(height: 20,),
            
                  ElevatedButton(
                    onPressed: _openEditOverlay, 
                    child: const Text('Edit')),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}