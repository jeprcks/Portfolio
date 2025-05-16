// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'skills.dart';
import 'projects.dart';
import 'contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isEyeClosed = false;
  
  // Add scroll controller for section navigation
  final ScrollController _scrollController = ScrollController();
  
  // Section keys for scrolling
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    // Blink eyes every 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isEyeClosed = !_isEyeClosed;
      });
    });
    
    // Set web-specific fullscreen settings
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildRobotAvatar() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 10 * _controller.value),
          child: child,
        );
      },
      child: SizedBox(
        width: 200,
        height: 300,
        child: Stack(
          children: [
            // Robot Body
            Positioned(
              bottom: 0,
              left: 50,
              child: Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Body Details - Control Panel
                    Positioned(
                      top: 20,
                      left: 25,
                      child: Container(
                        width: 50,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 20,
                              height: 5,
                              color: Colors.red,
                            ),
                            Container(
                              width: 20,
                              height: 5,
                              color: Colors.green,
                            ),
                            Container(
                              width: 20,
                              height: 5,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Robot Arms
                    Positioned(
                      top: 30,
                      left: -15,
                      child: Container(
                        width: 20,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: -15,
                      child: Container(
                        width: 20,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Robot Head
            Positioned(
              top: 0,
              left: 25,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(75),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blueGrey.shade400,
                      Colors.blueGrey.shade700,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Antenna
                    Positioned(
                      top: -15,
                      left: 65,
                      child: Container(
                        width: 20,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Eyes
                    Positioned(
                      top: 40,
                      left: 30,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 30,
                        height: _isEyeClosed ? 5 : 30,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 30,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 30,
                        height: _isEyeClosed ? 5 : 30,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Mouth
                    Positioned(
                      bottom: 40,
                      left: 50,
                      child: Container(
                        width: 50,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
  
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.blueGrey[800],
      child: Column(
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.android,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Jeffrey Baclay',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Mobile & Web App Developer',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.white70,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Menu items section
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 8),
                _buildDrawerItem(Icons.person_outline, 'About Me'),
                _buildDrawerItem(Icons.code_outlined, 'Skills'),
                _buildDrawerItem(Icons.work_outline, 'Projects'),
                _buildDrawerItem(Icons.contact_mail_outlined, 'Contact'),
                const Divider(color: Colors.white30),
              ],
            ),
          ),
          // Footer section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900]!.withOpacity(0.7),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© ${DateTime.now().year} JJB',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                // Footer is clean with just the copyright
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDrawerItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.white.withOpacity(0.1),
          highlightColor: Colors.white.withOpacity(0.05),
          onTap: () {
            // Close the drawer
            Navigator.pop(context);
            
            // Navigate to the corresponding page or scroll to section
            if (title == 'Skills') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SkillsPage()),
              );
            } else if (title == 'Projects') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProjectsPage()),
              );
            } else if (title == 'Contact') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactPage()),
              );
            } else {
              // For 'About Me' or other sections, scroll to the section
              _scrollToSection(title);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white70,
                  size: 22,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withOpacity(0.3),
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void _scrollToSection(String title) {
    GlobalKey? targetKey;
    
    // Determine which section to scroll to
    switch (title) {
      case 'About Me':
        targetKey = _aboutKey;
        break;
      case 'Skills':
        targetKey = _skillsKey;
        break;
      case 'Projects':
        targetKey = _projectsKey;
        break;
      case 'Contact':
        targetKey = _contactKey;
        break;
      default:
        return;
    }
    
    // Find the render box of the target section
    final RenderObject? renderObject = targetKey.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final position = renderObject.localToGlobal(Offset.zero);
      // Scroll to the position with some padding
      _scrollController.animateTo(
        position.dy - 100, // Subtract some padding to account for AppBar
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size to ensure full screen coverage
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      // Remove any system padding to ensure fullscreen
      extendBodyBehindAppBar: true,
      extendBody: true,
      // Add drawer to the left side
      drawer: _buildDrawer(),
      // Add AppBar with menu icon
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: SingleChildScrollView(
          controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              _buildRobotAvatar(),
              const SizedBox(height: 30),
              Text(
                "John Jeffrey Baclay",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Container(
                key: _aboutKey,
                child: _buildSection(
                  "About Me",
                  "I am a passionate full-stack developer with a strong focus on Flutter and cross-platform mobile development. With a solid foundation in Dart, Node.js, Next.js, Firebase, and Laravel, I build responsive, user-friendly applications across both mobile and web platforms. AI enables me to bring advanced, intelligent features into my projects, delivering innovative and high-performing solutions to real-world problems.",
                ),
              ),
              Container(
                key: _skillsKey,
                child: _buildSection(
                  "Skills",
                  "- Dart/Flutter\n- Node.js\n- Next.js\n- Firebase\n- Laravel\n- AI Programming",
                ),
              ),
              Container(
                key: _projectsKey,
                child: _buildSection(
                  "Projects",
                  "1. Albertos Pizza Shop\n2.  Don Machiatos\n3. Furever Home\n4. EsportsGS",
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}