import 'package:attendance_app/widgets/edit_photo.dart';
import 'package:attendance_app/widgets/edit_screen.dart';
import 'package:attendance_app/models/profil_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance_app/widgets/widgets_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  Future<Map<String, dynamic>> fetchData() async{
    final response = await http.get(Uri.parse('http://localhost:3000/users'));
    if(response.statusCode == 200){
      final List<dynamic> userList = jsonDecode(response.body);
      if (userList.isNotEmpty) {
        // Jika ada data, ambil data pertama dari list
        return userList[0];
      }else{
        throw Exception('No user data found');
      }
    } else{
      throw Exception('Failded to load data');
    }
  }

class ProfilLayout extends StatefulWidget{
  const ProfilLayout({super.key});
  
  @override
  State<ProfilLayout> createState() {
    return _ProfilLayout();
  }
}

class _ProfilLayout extends State<ProfilLayout>{
  String _address = ''; // Tambahkan variabel name
  String _phone = ''; // Tambahkan variabel phone

  @override
  void initState(){
    super.initState();
    fetchData().then((data){
      setState(() {
        _address = data['address'];
        _phone = data['no_phone'];
      });
    });
  }

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
      _address = item.alamat;
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
                  
                  buildColumnProfil(_address, _phone),
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