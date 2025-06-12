import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomNavbar.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'splashpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nbiController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _nbiController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    _instagramController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final String name = _nameController.text.trim();
    final String nbi = _nbiController.text.trim();
    final String email = _emailController.text.trim();
    final String alamat = _alamatController.text.trim();
    final String instagram = _instagramController.text.trim();

    if (name.isEmpty ||
        nbi.isEmpty ||
        email.isEmpty ||
        alamat.isEmpty ||
        instagram.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua field harus diisi')));
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('nbi', nbi);
    await prefs.setString('email', email);
    await prefs.setString('alamat', alamat);
    await prefs.setString('instagram', instagram);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SplashPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/undraw_note_list_re_r4u9 1.png',
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'WELCOME',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Praktikum PAB 2025',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 100),
              _buildShadowTextField(
                controller: _nameController,
                hintText: 'Masukan Nama',
              ),
              const SizedBox(height: 16),
              _buildShadowTextField(
                controller: _nbiController,
                hintText: 'Masukan NBI',
              ),
              const SizedBox(height: 16),
              _buildShadowTextField(
                controller: _emailController,
                hintText: 'Masukkkan Email',
              ),
              const SizedBox(height: 16),
              _buildShadowTextField(
                controller: _alamatController,
                hintText: 'Masukkkan Alamat',
              ),
              const SizedBox(height: 16),
              _buildShadowTextField(
                controller: _instagramController,
                hintText: 'Masukkkan Akun Instagram',
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF71957D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShadowTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 1, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
