import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/core/constants/colors/mainColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isProduct = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: subColor,
      ),
      body: SingleChildScrollView(child: Column(children: [Text('ewf')])),
    );
  }
}
