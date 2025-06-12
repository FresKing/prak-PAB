import 'package:flutter/material.dart';
import 'bottomNavbar.dart';
import 'register.dart';
import 'masukPage.dart';
import 'splashpage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiket Konser',
      //home: BottomNavbar(),
      //home: Masukpage(),
      //home: RegisterPage(),
      home: SplashPage(),
    );
  }
}
