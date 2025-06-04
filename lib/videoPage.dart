import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicVideoScreen extends StatelessWidget {
  final String youtubeUrl = 'https://www.youtube.com/watch?v=kvhNCk257WY';

  String get videoId {
    // Ekstrak ID dari berbagai format YouTube URL
    final uri = Uri.parse(youtubeUrl);
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.first;
    } else if (uri.host.contains('youtube.com') &&
        uri.queryParameters['v'] != null) {
      return uri.queryParameters['v']!;
    } else {
      return ''; // fallback
    }
  }

  String get thumbnailUrl => 'https://img.youtube.com/vi/$videoId/0.jpg';

  void _launchYoutube() async {
    final Uri url = Uri.parse(youtubeUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka URL: $youtubeUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            const Text(
              '[MV] #KuSangatSuka - JKT48',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 300,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnailUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: _launchYoutube,
                child: Text("Play"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
