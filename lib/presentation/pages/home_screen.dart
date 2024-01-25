import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Image.asset(
            'assets/img/logo.png',
            fit: BoxFit.contain,
            height: 60,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 28,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
