import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<void> loginUser(String NIP, String user_pass) async{
  final url = Uri.parse('http://localhost:4000/login');
  final response = await http.post(
    url,
    body: json.encode({'NIP' : NIP, 'user_pass' : user_pass}),
    headers: {'Content-Type' : 'application/json'},
  );
  if (response.statusCode == 200) {
    // jika berhasil
    print('Login Successful!');
  }else{
    // jika gagal
    print('Login failed: ${response.body}');
    // Misalnya, menampilkan pesan kesalahan pada pengguna

  }
}

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);


  @override
  _LoginScreenState createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isFilled = false;
  bool _showPassword = false;

  @override
  void initState(){
    super.initState();
    // Mengunakan listener untuk memperbarui state ketika pengguna mengubah teks
    _usernameController.addListener(_checkField);
    _passwordController.addListener(_checkField);
  }  

  // Method untuk memeriksa apakah kedua bidang teks telash diisi
  void _checkField(){
    setState(() {
      _isFilled = _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

    @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 512,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 140,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/polinema.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                "Sign In",
                style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: _showPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextButton(
                onPressed: (){},
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                  ),
                )
              ),
              ElevatedButton(
                onPressed: ()async{
                  String NIP = _usernameController.text;
                  String user_pass = _passwordController.text;
                  loginUser(NIP, user_pass);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  backgroundColor: _isFilled ? Colors.blue : Colors.transparent,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
  
}