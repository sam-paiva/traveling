import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function changePage;

  BottomBar({this.currentIndex, this.changePage});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0XFFe94f37),
      currentIndex: currentIndex,
      onTap: changePage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.hotel),
        //   title: Text("Hoteis"),
        // ),
      ],
    );
  }
}
