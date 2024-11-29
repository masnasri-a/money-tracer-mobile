import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:monaey_tracking/auth/login_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Auth Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  _AuthPage(),
      routes: {
        '/login': (context) => const LoginForm(),
      },
    );
  }
}

class _AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width - 50,
                height: MediaQuery.sizeOf(context).width - 50,
                child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 20,
                    color: const Color.fromARGB(255, 8, 61, 119)),
                  borderRadius: BorderRadius.circular(20),
                  gradient: const RadialGradient(
                  colors: [
                    Color.fromARGB(255, 41, 96, 155),
                    Color.fromARGB(255, 8, 61, 119)
                  ],
                  center: Alignment.center,
                  radius: 0.3,
                  ),
                  image: const DecorationImage(
                  image: AssetImage('assets/images/fingerprint.png'),
                  fit: BoxFit.contain,
                  ),
                ),
                ),
              ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
              'Money Tracking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0), // Tambahkan padding antar tombol
                  child: GFButton(
                  onPressed: () {},
                  text: "Register",
                  color: Color.fromARGB(255, 8, 61, 119),
                  size: GFSize.LARGE,
                  padding: const EdgeInsets.all(10),
                  type: GFButtonType.solid,
                  ),
                ),
                ),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GFButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  text: "Sign In",
                  color: Color.fromARGB(255, 8, 61, 119),
                  size: GFSize.LARGE,
                  padding: const EdgeInsets.all(10),
                  type: GFButtonType.outline,
                  ),
                ),
                ),
              ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
