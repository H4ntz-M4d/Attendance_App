import 'package:attendance_app/profil_screen.dart';
import 'package:attendance_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/api/using_port.dart';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    )
  );
}