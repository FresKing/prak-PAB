import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../register.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences prefs;
  String name = '';
  String nbi = '';
  String email = '';
  String alamat = '';
  String instagram = '';

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
      email = prefs.getString('email') ?? 'Tidak ada data';
      alamat = prefs.getString('alamat') ?? 'Tidak ada data';
      instagram = prefs.getString('instagram') ?? 'Tidak ada data';
    });
  }

  Future<void> _logout(BuildContext context) async {
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: CurvedAppBar(),
            child: Container(
              height: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 130),
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 4),
                      color: Colors.white,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/fritzy_rosmerian.jpg',
                      ),
                      radius: 70,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildInfoCard(Icons.account_circle, 'Nama', name),
                      const SizedBox(height: 10),
                      _buildInfoCard(Icons.phone, 'NBI', nbi),
                      const SizedBox(height: 10),
                      _buildInfoCard(Icons.email, 'Email', email),
                      const SizedBox(height: 10),
                      _buildInfoCard(Icons.location_on, 'Alamat', alamat),
                      const SizedBox(height: 10),
                      _buildInfoCard(
                        Icons.alternate_email,
                        'Instagram',
                        instagram,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _logout(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Keluar',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
