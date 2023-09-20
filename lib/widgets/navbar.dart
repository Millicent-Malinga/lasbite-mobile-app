import 'package:flutter/material.dart';
import '../add_bite.dart';
import '../home.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePageContent(), // Homepage 
    AddABitePage(), // AddBitePage
    // Add message page and Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          if (_currentIndex != 1) // Hide bottom navigation when on AddABitePage
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddABitePage(),
                      ),
                    );
                  } else {
                    setState(() => _currentIndex = index);
                  }
                },
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color.fromRGBO(37, 68, 6, 1),
                unselectedItemColor: Colors.black,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add'),
                  BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: 'Message'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
