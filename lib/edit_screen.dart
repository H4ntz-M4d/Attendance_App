import 'package:attendance_app/models/profil_item.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget{
  const EditScreen({super.key, required this.editProfile});
  
  final void Function(ProfilItem) editProfile;

  @override
  State<EditScreen> createState() {
    return _EditScreenState();
  }
}


class _EditScreenState extends State<EditScreen>{

  String _name = '';
  String _phone = '';
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _updateProfile(String name, String phone){
    setState(() {
      _name = name;
      _phone = phone;
    });
  }

  void _saveEditing(){
    final newName = _nameController.text;
    final newPhone = _phoneController.text;

  // Panggil callback untuk mengirim nilai nama dan nomor telepon
    widget.editProfile(ProfilItem(nim: '', name: newName, ttl: '', noHp: newPhone));
    _updateProfile(newName, newPhone);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, right: 40, left: 40),
      child: Column(children: [
        TextField(
          controller: _nameController,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text('Nama')
          ),
        ),
      
        TextField(
          controller: _phoneController,
          maxLength: 15,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text('No. Handphone')
          ),
        ),

        ElevatedButton(
          onPressed: () {
            _saveEditing();
            Navigator.pop(context);
          }, 
          child: const Text('Save')
          )
        ],
      ),
    );
  }
}