import 'package:firstapp/pages/about.dart';
import 'package:firstapp/pages/contact.dart';
import 'package:firstapp/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/widgets/liquid_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedPageIndex = 0;

  final List _pages = [
    const Center(child: Text("Home Page")),
    const AboutPage(),
    const ContactPage(),
    const SettingsPage(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        centerTitle: true,
      ),

      body: LiquidBackground(
        child: _pages[_selectedPageIndex],
      ),

    drawer: Drawer(
      child: Column(
            children: [
              const DrawerHeader(child: Icon(Icons.favorite)),
              ListTile(
                  title: const Text('About'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about');
                  }
              ),
              ListTile(
                  title: const Text('Contact'),
                  onTap: () => Navigator.pushNamed(context, '/contact')
              ),
              ListTile(
                  title: const Text('Settings'),
                  onTap: () => Navigator.pushNamed(context, '/settings')
              ),
            ]
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Contact'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}