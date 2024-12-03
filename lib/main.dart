import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monaey_tracking/auth/auth_page.dart';
import 'package:monaey_tracking/auth/login_form.dart';
import 'package:monaey_tracking/dashboard/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/auth': (context) => AuthPage(),
        '/main': (context) => MainPage(),
        '/login': (context) => const LoginForm(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 8, 61, 119),
      child: const Center(
          key: ValueKey("SplashScreen"),
          child: Image(
            image: AssetImage('assets/images/money.png'),
            height: 100,
            width: 100,
          )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // return prefs.containsKey('auth_token');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Checker',
      home: FutureBuilder<bool>(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!) {
            return MainPage(); // Pengguna sudah login
          } else {
            return AuthPage(); // Pengguna belum login
          }
        }
      ),
    );
  }
}
