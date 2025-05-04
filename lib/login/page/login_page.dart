import 'package:flutter/material.dart';
//import 'package:food_delivery_app/homescreen/page/home_page.dart';
import 'package:food_delivery_app/navigation_bar/page/navigation_bar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void login() {
    final email = emailcontroller.text;
    final password = passwordcontroller.text;
    final isNumeric = RegExp(r'^[0-9]+$').hasMatch(password);

    if (email.endsWith('@gmail.com') && isNumeric) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationBarPage(email: email),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Login Failed'),
              content: Text('Invalid email or password'),
            ),
      );
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
