import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // ignore: avoid_print
  void login() {
    final email = emailcontroller.text;
    final password = passwordcontroller.text;

    if (email.endsWith('@gmail.com') && password == '12345') {
      Navigator.pushNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Login Failed'),
              content: Text('Invalid email or password'),
            ),
      );
      // ignore: avoid_print
      //print("redfg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: passwordcontroller,

              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            child: ElevatedButton(onPressed: login, child: Text('Login')),
          ),
        ],
      ),
    );
  }
}
