import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomNavbar.dart';
import 'register.dart';
import 'masukPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 3)); // Add 3 seconds delay
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');

    if (name != null && name.isNotEmpty) {
      // User is logged in, navigate to Masukpage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Masukpage()),
      );
    } else {
      // User not logged in, navigate to RegisterPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegisterPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3987B2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/53571013_1-removebg-preview.png',
              width: 300,
              height: 300,
            ),
            //const SizedBox(height: 10),
            const Text(
              'PRAKTIKUM PAB 2025',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
