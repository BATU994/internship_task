import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/presentation/pages/add.dart';
import 'package:internship_project_itemstorage/presentation/pages/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      body: [HomePage(), AddModels()][pageIndex],
    );
  }
}
