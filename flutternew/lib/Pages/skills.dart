import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Skills'),
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
              'Technical Skills',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildSkillCategory('Programming Languages', _programmingSkills()),
            const SizedBox(height: 30),
            _buildSkillCategory('Frameworks & Libraries', _frameworkSkills()),
            const SizedBox(height: 30),
            _buildSkillCategory('Tools & Technologies', _toolSkills()),
            const SizedBox(height: 30),
            _buildSkillCategory('Soft Skills', _softSkills()),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<Widget> skills) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          ...skills,
        ],
      ),
    );
  }

  List<Widget> _programmingSkills() {
    return [
      _buildSkillBar('Dart', 0.9, Colors.blue),
      _buildSkillBar('Php', 0.85, Colors.yellow[700]!),
      _buildSkillBar('React', 0.8, Colors.green),
      _buildSkillBar('NextJs', 0.7, Colors.orange), 
    ];
  }

  List<Widget> _frameworkSkills() {
    return [
      _buildSkillBar('Flutter', 0.9, Colors.blue[300]!),
      _buildSkillBar('React', 0.8, Colors.blue[600]!),
      _buildSkillBar('Node.js', 0.75, Colors.green[600]!),
      _buildSkillBar('Laravel', 0.7, Colors.orange),  

    ];
  }

  List<Widget> _toolSkills() {
    return [
      _buildSkillBar('Git/GitHub', 0.9, Colors.grey),
      _buildSkillBar('Docker', 0.75, Colors.blue[800]!),
      _buildSkillBar('Firebase', 0.85, Colors.amber),
    ];
  }

  List<Widget> _softSkills() {
    return [
      _buildSkillBar('Problem Solving', 0.95, Colors.indigo),
      _buildSkillBar('Team Collaboration', 0.9, Colors.teal),
      _buildSkillBar('Communication', 0.85, Colors.pink),
      _buildSkillBar('Time Management', 0.8, Colors.amber[800]!),
      _buildSkillBar('Adaptability', 0.9, Colors.deepPurple),
    ];
  }

  Widget _buildSkillBar(String skill, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.blueGrey[700],
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
