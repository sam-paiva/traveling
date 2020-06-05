import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/models/hotel_model.dart';
import 'package:mobile/pages/login/login_controller.dart';

import 'hotel_controller.dart';

class HotelPage extends StatefulWidget {
  final Hotel hotel;

  const HotelPage({Key key, this.hotel}) : super(key: key);

  @override
  HotelState createState() => HotelState();
}

class HotelState extends State<HotelPage> {
  final loginController = Modular.get<LoginController>();
  final homeController = Modular.get<HotelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.hotel.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage(this.widget.hotel.imageUrl.trim()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.hotel.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.city,
                            size: 15.0, color: Colors.black),
                      ),
                      Text(
                        widget.hotel.city,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 15.0,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.hotel.address,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.phone,
                            size: 15.0, color: Colors.black),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.hotel.phone,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
