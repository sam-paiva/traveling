import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/bottom_bar.dart';
import 'package:mobile/components/destination_carousel.dart';
import 'package:mobile/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  int _selectedIndex = 0;
  List<IconData> _icons = [FontAwesomeIcons.plane, FontAwesomeIcons.bed];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.redAccent : Colors.red[100],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index ? Colors.white : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return (this.controller.currentIndex == 0)
        ? Scaffold(
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 120.0),
                    child: Text(
                      'O que você está procurando?',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  DestinationCarousel(
                      destinations: this.controller.destination),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          )

        // DestinationCarousel(
        //     destinations: this.controller.destination,
        //   )
        : _buildBodyHotels();
  }

  Widget _buildBodyHotels() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: this.controller.hotels.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.white,
            child:
                Center(child: Text('Entry ${this.controller.hotels[index]}')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: (this.controller.destination != null)
              ? _buildBody()
              : Center(
                  child: CircularProgressIndicator(),
                ),
          bottomNavigationBar: BottomBar(
              currentIndex: this.controller.currentIndex,
              changePage: this.controller.changePage),
        );
      },
    );
  }
}
