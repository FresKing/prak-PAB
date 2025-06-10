import 'package:flutter/material.dart';
import 'bottomNavbar.dart';
import 'authentication/register.dart';
import 'authentication/login.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiket Konser',
      home: BottomNavbar(),
      //home: RegisterPage(),
      //home: LoginPage(), // Uncomment this line to use the RegisterPage
    );
  }
}
