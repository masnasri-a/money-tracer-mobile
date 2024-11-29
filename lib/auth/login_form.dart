import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(fontFamily: String.fromEnvironment('Roboto')),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Enter Email Address",
                  labelStyle: TextStyle(
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
