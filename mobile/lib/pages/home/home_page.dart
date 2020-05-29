import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/components/app_bar.dart';
import 'package:mobile/components/destination_carousel.dart';
import 'package:mobile/components/hotels_carousel.dart';
import 'package:mobile/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Widget _buildBody() {
    return Scaffold(
      appBar: CustomAppBar(hotels: this.controller.hotels),
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
            SizedBox(height: 30.0),
            DestinationCarousel(destinations: this.controller.destination),
            HotelCarousel(hotels: this.controller.hotels)
          ],
        ),
      ),
    );

    // DestinationCarousel(
    //     destinations: this.controller.destination,
    //   )
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
          // bottomNavigationBar: BottomBar(
          //     currentIndex: this.controller.currentIndex,
          //     changePage: this.controller.changePage),
        );
      },
    );
  }
}
