import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildContactInfo(),

          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _buildContactItem(
            Icons.email,
            'Email',
            'baclayjeffrey@gmail.com',
          ),
          const SizedBox(height: 15),
          _buildContactItem(
            Icons.phone,
            'Phone',
            '09232142446',
          ),
          const SizedBox(height: 15),
          _buildContactItem(
            Icons.location_on,
            'Location',
            'Tayud,Consolacion,Cebu',
          ),
          const SizedBox(height: 15),
          _buildSocialMediaLinks(),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String content) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 24,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialMediaLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(
          Icons.code, 
          Colors.white, 
          'https://github.com/jeprcks'
        ), // GitHub
        const SizedBox(width: 20),
        _buildSocialIcon(
          Icons.facebook,
          Colors.blue,
          'https://facebook.com/jeprcks'
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          Icons.close, // Using 'close' icon as it resembles the X logo
          Colors.white, 
          'https://x.com/JeprehJohn'
        ), // X (formerly Twitter)
        const SizedBox(width: 20),
        _buildSocialIcon(
          Icons.photo_camera, 
          Colors.pink, 
          'https://www.instagram.com/j3prcks/'
        ), // Instagram
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color, String url) {
    return InkWell(
      onTap: () {
        UrlHelper.openUrl(context, url);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    );
  }




}
