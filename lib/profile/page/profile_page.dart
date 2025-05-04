import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String email;

  const ProfilePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    String firstLetter = email.isNotEmpty ? email[0].toUpperCase() : '';
    //String secondLetter = email.isNotEmpty ? email[2].toUpperCase() : '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  firstLetter,
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Text(
              //   secondLetter,
              //   style: TextStyle(fontSize: 16, color: Colors.grey),
              // ), // Space between avatar and email
              Text(
                ' $email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This is your profile page.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
