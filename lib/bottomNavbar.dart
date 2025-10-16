import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/presentation/pages/add.dart';
import 'package:internship_project_itemstorage/src/presentation/pages/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int pageIndex = 0;

  final List<Widget> pages = const [HomePage(), AddModels()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
        currentIndex: pageIndex,
        selectedItemColor: subColor,
        unselectedItemColor: textColor,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
