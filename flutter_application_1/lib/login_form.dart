// lib/login_form.dart

import 'package:flutter/material.dart';
import 'home.dart';
import 'register_form.dart';
import 'forgot_password.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _showPassword = false;

  Widget buildTextField(String labelText, TextInputType keyboardType,
      {bool isPassword = false}) {
    return Container(
      width: 300.0, // Set your desired width
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                )
              : null,
        ),
        obscureText: isPassword && !_showPassword,
        keyboardType: keyboardType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 26, 26, 1),
        centerTitle: true,
        title: const Text(
          'SignCom',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(21, 20, 21, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/logo2.png'),
              width: 100.0,
              height: 120.0,
            ),
            const SizedBox(height: 16.0),

            buildTextField('Username', TextInputType.text),
            const SizedBox(height: 16.0),

            buildTextField('Email', TextInputType.emailAddress),
            const SizedBox(height: 16.0),

            buildTextField('Password', TextInputType.text, isPassword: true),
            const SizedBox(height: 16.0), 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 255, 163, 1),
                      onPrimary: Colors.black),
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterForm()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 255, 163, 1),
                      onPrimary: Colors.black),
                  child: const Text('Register'),
                ),
              ],
            ),

            SizedBox(height: 16.0),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
