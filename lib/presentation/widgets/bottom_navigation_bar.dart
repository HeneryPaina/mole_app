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


  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return Center(child: HomeScreen());
      case 1:
        return Center(child: MoviesScreen());
      case 2:
        return Center(child: PerfilScreen());
      default:
        return Center(child: Text('Unknown Screen'));
    }
  }

  Widget buildBottomNavItem(
      IconData icon,
      String label,
      int index,
      double textScale,
      ) {
    final isSelected = _selectedIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: isSelected ? 30.0 * textScale : 25.0 * textScale,
          ),
          color: isSelected ? Colors.red : Colors.grey,
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ],
    );
  }
}
