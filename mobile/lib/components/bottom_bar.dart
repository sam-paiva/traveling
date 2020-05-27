import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function changePage;

  BottomBar({this.currentIndex, this.changePage});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.grey.shade800,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: changePage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.group_work),
          title: Text("Destinos"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          title: Text("Hoteis"),
        ),
      ],
    );
  }
}
