import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                ),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://jkt48.com/profile/fritzy_rosmerian.jpg',
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
                  _buildInfoCard(
                    Icons.account_circle,
                    'Nama',
                    'Mukhammad Faris',
                  ),
                  const SizedBox(height: 10),
                  _buildInfoCard(Icons.phone, 'NBI', '1462200231'),
                  const SizedBox(height: 10),
                  _buildInfoCard(Icons.email, 'Email', 'faris@gmail.com'),
                  const SizedBox(height: 10),
                  _buildInfoCard(
                    Icons.location_on,
                    'Lokasi',
                    'Surabaya, Indonesia',
                  ),
                  _buildInfoCard(
                    Icons.alternate_email,
                    'Instagram',
                    '@Fresking_',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
