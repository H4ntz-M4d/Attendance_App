import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildEditImage(){
  return Stack(
    children: [
      Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.blue),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1)
            )
          ],
          shape: BoxShape.circle,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/art.png')
          )
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue
          ),
          child: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.camera_alt_rounded,color: Colors.white,))
        ),
      )
    ],
  );
}