import 'package:attendance_app/profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ProfilLayout()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 28, 54, 255),
              Color.fromARGB(255, 166, 215, 255),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const 
              Image(
                image: AssetImage(
                  'assets/logo.jpg'),
              ),
            ),
            const SizedBox(height: 40,),
            Text(
              "Let's Absen",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: const Color.fromARGB(255, 255, 255, 255)
              ),
            )
        ],),
      ),
    );
  }
}