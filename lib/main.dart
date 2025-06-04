import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'bottomNavbar.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiket Konser',
      home: BottomNavbar(),
    );
  }
}
