import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTTP Request Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              createUser();
            },
            child: Text('Create User'),
          ),
        ),
      ),
    );
  }
Future<void> createUser() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/create'), // Change the URL accordingly
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'NIP': '123456',
        'username': 'JohnDoe',
        'user_pass': 'password123',
        'email': 'john@example.com',
        'birth': '1990-01-01',
        'address': '123 Main Street',
        'no_phone': '1234567890',
      }),
    );

    if (response.statusCode == 201) {
      print('User created successfully');
    } else {
      print('Failed to create user');
    }
  }
}
