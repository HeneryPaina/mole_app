import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/home_screen.dart';
import 'package:movie_app/presentation/pages/movies_screen.dart';
import 'package:movie_app/presentation/pages/perfil_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildBottomNavItem(Icons.home_filled, 'Home', 0, textScale),
            buildBottomNavItem(
                Icons.play_circle_outline, 'Movies', 1, textScale),
            buildBottomNavItem(Icons.person, 'Perfil', 2, textScale),
          ],
        ),
      ),
    );
  }
}
