import 'package:flutter/material.dart';

Widget buildColumnProfil(String alamat, String phone){
  return Column(children: [
    const InputDecorator(
      decoration: InputDecoration(
        icon: Icon(Icons.assignment_ind),
        labelText: 'NIP',
        contentPadding: EdgeInsets.symmetric(vertical: 10)
      ),
      child: Text(
        '2231750008',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    ),

    const SizedBox(height: 28,),
    const InputDecorator(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Nama',
        contentPadding: EdgeInsets.symmetric(vertical: 10)
      ),
      child: Text(
        'Ince Ahmad',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    ),

    const SizedBox(height: 28,),
    const InputDecorator(
      decoration: InputDecoration(
        icon: Icon(Icons.assignment_ind),
        labelText: 'Tempat/Tanggal Lahir',
        contentPadding: EdgeInsets.symmetric(vertical: 10)
      ),
      child: Text(
        'Fak-fak, 18 mei 2004',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    ),

    const SizedBox(height: 28,),
    InputDecorator(
      decoration: const InputDecoration(
        icon: Icon(Icons.assignment_ind),
        labelText: 'Alamat',
        contentPadding: EdgeInsets.symmetric(vertical: 10)
      ),
      child: Text(
        alamat,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    ),

    const SizedBox(height: 28,),
    InputDecorator(
      decoration: const InputDecoration(
        icon: Icon(Icons.phone),
        labelText: 'No. Handphone',
        contentPadding: EdgeInsets.symmetric(vertical: 10)
      ),
      child: Text(
        phone,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
  )]
  );
}