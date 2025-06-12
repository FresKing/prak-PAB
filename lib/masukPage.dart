import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomNavbar.dart';

class Masukpage extends StatefulWidget {
  const Masukpage({super.key});

  @override
  _MasukpageState createState() => _MasukpageState();
}

class _MasukpageState extends State<Masukpage> {
  late SharedPreferences prefs;
  String name = '';
  String nbi = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Tidak ada data';
      nbi = prefs.getString('nbi') ?? 'Tidak ada data';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'PRAKTIKUM PAB 2025',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 40),
            Text(
              nbi,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            Image.asset(
              'assets/images/fritzy_rosmerian.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavbar()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Masuk',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
