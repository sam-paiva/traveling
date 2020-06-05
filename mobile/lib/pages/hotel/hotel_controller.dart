import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/repositories/traveling_repository.dart';
import 'package:mobile/viewModels/create_hotel_vm.dart';
import 'package:mobx/mobx.dart';
part 'hotel_controller.g.dart';

class HotelController = _HotelControllerBase with _$HotelController;

abstract class _HotelControllerBase with Store {
  final api = Modular.get<TravelingRepository>();

  @action
  Future<bool> storeHotel(CreateHotelViewModel model) async {
    try {
      bool success = await api.storeHotel(model);
      return success;
    } catch (e) {
      throw e;
    }
  }
}
