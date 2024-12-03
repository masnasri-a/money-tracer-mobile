import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monaey_tracking/components/utils/toast.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:zod_validation/zod_validation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);


  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;
  String email = '';
  String password = '';

  void _submit() {
    // Implement login logic here
    final requiredParam = {
      'email': Zod().email(),
      'password': Zod().min(8)
    };

    final data = {
      'email': email,
      'password': password
    };

    final result = Zod.validate(data: data, params: requiredParam);
    if (result.isNotValid){
      Toast.show(context, "Invalid email or password", type: ToastType.warning);
      return;
    }

    Navigator.pushNamed(context, '/main');
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 61, 119),
          foregroundColor: Colors.white,
          title: const Text(
            'Login',
            style: TextStyle(fontFamily: String.fromEnvironment('Roboto')),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color.fromARGB(255, 8, 61, 119),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Center(
                child: SizedBox(
              width: MediaQuery.sizeOf(context).width - 50,
              height: MediaQuery.sizeOf(context).width,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  border: Border.all(
                    width: 20,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 50,
                        height: 50,
                        child: SignInButton(
                          Buttons.google,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 41, 96, 155),
                              width: 2.0,
                            ),
                          ),
                          text: "Sign up with Google",
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        autocorrect: false,
                        onChanged: (value) => email = value,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 96, 155),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 96, 155),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined),
                          labelText: " Enter Email Address ",
                          labelStyle: TextStyle(
                            fontFamily:
                                GoogleFonts.plusJakartaSans().fontFamily,
                            color: Colors.grey.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            gapPadding: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        autocorrect: false,
                        onChanged: (value) => password = value,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 96, 155),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 96, 155),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          labelText: " Enter Password ",
                          labelStyle: TextStyle(
                            fontFamily:
                                GoogleFonts.plusJakartaSans().fontFamily,
                            color: Colors.grey.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            gapPadding: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 50,
                        child: GFButton(
                          onPressed: () {
                            _submit();
                          },
                          text: "Sign In",
                          color: const Color.fromARGB(255, 8, 61, 119),
                          borderShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          ),
                          fullWidthButton: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ));
  }
}
