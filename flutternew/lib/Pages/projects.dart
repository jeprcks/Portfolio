// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  void _launchURL(BuildContext context, String urlString) {
    // Use our custom URL helper that works reliably on web
    UrlHelper.openUrl(context, urlString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
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
              'Featured Projects',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                _buildProjectCard(
                  context,
                  'Albertos Pizza Shop',
                  'Albertos Pizza Shop is a Point of Sale (POS) system designed to streamline the order-taking, inventory management, and sales tracking processes for Albertos Pizza branches. This system aims to improve operational efficiency and provide a smoother customer experience across all locations.',
                  Icons.local_pizza,
                  Colors.blue[700]!,
                  'https://github.com/jeprcks/AlbertosPizzaShop',
                ),
                _buildProjectCard(
                  context,
                  'Furever Home: A Mobile Application for Dog Rescue and Adoption Using Flutter and Firebase',
                  'Furever Home is a mobile application for dog rescue and adoption using Flutter and Firebase. It provides a user-friendly interface for users to search for available dogs, view their details, and make adoption requests.',
                  Icons.pets,
                  Colors.green[600]!,
                  'https://github.com/jeprcks/FureverHome',
                ),
                _buildProjectCard(
                  context,
                  'ESportsGS',
                  'Esports Gaming Schedule to list our track your practice schedule and plan for the next practice',
                  Icons.gamepad,
                  Colors.purple[600]!,
                  'https://github.com/jeprcks/EsportsGS',
                ),
                _buildProjectCard(
                  context,
                  'Don Machiatos',
                  'Don Machiatos is a mobile application for ordering and tracking food delivery using Flutter and Firebase. It provides a user-friendly interface for users to search for available food items, view their details, and make orders.',
                  Icons.local_pizza,
                  Colors.orange[600]!,
                  'https://github.com/jeprcks/don-mach-sales-interface',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    String projectUrl,
  ) {
    return GestureDetector(
      onTap: () => _showProjectDetails(context, title, description, icon, color, projectUrl),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.blueGrey[800]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: color,
            ),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _showProjectDetails(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    String projectUrl,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        size: 30,
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Technologies Used',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildTechChips(),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURL(context, projectUrl);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text('VIEW PROJECT'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTechChips() {
    final List<String> technologies = [
      'Flutter',
      'Dart',
      'Firebase',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: technologies.map((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            tech,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }

}
