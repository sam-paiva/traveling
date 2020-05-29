import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/pages/destination/destination_controller.dart';
import 'package:mobile/pages/destination/destination_page.dart';
import 'package:mobile/pages/home/home_controller.dart';
import 'package:mobile/pages/home/home_page.dart';
import 'package:mobile/pages/hotel/hotel_controller.dart';
import 'package:mobile/pages/hotel/hotel_page.dart';
import 'package:mobile/pages/login/login_controller.dart';
import 'package:mobile/pages/login/login_page.dart';
import 'package:mobile/repositories/traveling_repository.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TravelingRepository()),
        Bind((i) => HomeController()),
        Bind((i) => DestinationController()),
        Bind((i) => HotelController()),
        Bind((i) => LoginController())
      ];

  // rotas do módulo
  @override
  List<Router> get routers => [
        Router("/home", child: (_, args) => HomePage()),
        Router("/destination", child: (_, args) => DestinationPage()),
        Router("/hotel", child: (_, args) => HotelPage()),
        Router("/login", child: (_, args) => LoginPage()),
      ];

  //widget principal
  @override
  Widget get bootstrap => AppWidget();
}
