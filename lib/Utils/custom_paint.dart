import 'dart:math';
import 'package:flutter/material.dart';
import 'package:attendance_app/Layout/login_screen.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          contentPadding: EdgeInsets.all(20),
          content: SingleChildScrollView(
            child: LoginScreen(),
          ),
        );
      },
    );
  }
  
    //  @override
    //  Widget build(BuildContext context){
    //   return Stack(
    //     alignment: Alignment.center,
    //     children: [
    //       CustomPaint(
    //         size: Size.infinite,
    //         painter: ShapesPainter(),
    //       ),
    //       const LoginScreen(),
    //     ],
    //   );
    //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: ShapesPainter(),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: ElevatedButton(
              onPressed: (){
                 _showLoginDialog(context);
              },
              child: const Text('Login')
            ),
          )
        ],
      )
    );
  }
}

  class ShapesPainter extends CustomPainter {
    final random = Random();

    @override
    void paint(Canvas canvas, Size size) {
      final paint = Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.fill;

      // Draw multiple random circles
      for (int i = 0; i < 50; i++) {
        final radius = random.nextDouble() * 100;
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * size.height;
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }

    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return false;
    }
}