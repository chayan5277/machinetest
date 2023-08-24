import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/check_box.dart';
import 'package:http/http.dart' as http;

import 'screen2.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final TextEditingController number = TextEditingController();
  final TextEditingController passwords = TextEditingController();

  Future<void> _login() async {
    String loginapi = 'https://creativethoughtsinfo.com/nmt/Api/login_user';
    String username = number.text;
    String password = passwords.text;

    try {
      final response = await http.post(
        Uri.parse(loginapi),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        print('Login successful');

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyBottomNavigationBar(),
          ),
        );
      } else {
        print('Login failed: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during login: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/img1.png'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(child: Image.asset('assets/images/img2.png')),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login to your account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        filled: true,
                        fillColor: const Color(0XFFE8EDFF),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwords,
                    obscureText: true, // This hides the entered password
                    decoration: InputDecoration(
                      filled: true, // Add a background color
                      fillColor: Color(0XFFE8EDFF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              100)), // Set the background color
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(CupertinoIcons.eye_slash),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CheckboxExample(),
                      const Text(
                          'By proceeding you agree to our \n Terms & Conditions & Privacy Policy.')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: _login,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                      height: 40,
                      child: const Center(
                          child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New to NMT?'),
                      GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.blueAccent),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
