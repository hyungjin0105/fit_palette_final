import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fit_palette2/Auth/Auth_service.dart';  // Add your path here

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AuthService _authService = AuthService();  // create an instance of AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 300.0),
            Column(
              children: <Widget>[
                Image.asset('assets/logo.png', height:100),
                const SizedBox(height: 16.0),
              ],
            ),
            const SizedBox(height: 120.0),
            Container(
              height: 70,
              width: 200,
              child: TextButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/join1');
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 70,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  // _authService.signInWithGoogle();  // use the instance to call the method
                  Navigator.pushNamed(context, '/MainHome');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset('assets/google.png', height:50, fit: BoxFit.cover,)
                    ),
                    const SizedBox(width: 30),
                    Flexible(
                      child: Text("Sign in with Google",
                        style: TextStyle(fontSize: 20,
                        color: Colors.grey
                        ),
                      ),
                    ),
                  ],
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
