import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/models/destination_model.dart';
import 'package:mobile/models/hotel_model.dart';
import 'package:mobile/repositories/traveling_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<TravelingRepository>();

  _HomeControllerBase() {
    getDestinations();
    getHotels();
  }

  @observable
  int currentIndex = 0;

  @observable
  TextEditingController textFieldController = TextEditingController();

  @observable
  List<Destination> destination;

  @observable
  List<Hotel> hotels;

  @action
  getDestinations() async {
    try {
      destination = await api.getDestinations();
    } catch (exception) {
      return Container;
    }
  }

  @action
  changePage(int index) {
    currentIndex = index;
  }

  @action
  getHotels() async {
    try {
      hotels = await api.getHotels();
    } catch (exception) {
      return Container;
    }
  }
}
