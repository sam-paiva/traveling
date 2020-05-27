import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/pages/destination/destination_controller.dart';
import 'package:mobile/pages/destination/destination_page.dart';
import 'package:mobile/pages/home/home_controller.dart';
import 'package:mobile/pages/home/home_page.dart';
import 'package:mobile/repositories/traveling_repository.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TravelingRepository()),
        Bind((i) => HomeController()),
        Bind((i) => DestinationController())
      ];

  // rotas do módulo
  @override
  List<Router> get routers => [
        Router("/home", child: (_, args) => HomePage()),
        Router("/destination", child: (_, args) => DestinationPage())
      ];

  //widget principal
  @override
  Widget get bootstrap => AppWidget();
}
