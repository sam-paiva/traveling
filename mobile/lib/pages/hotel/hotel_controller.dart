import 'package:mobile/models/hotel_model.dart';
import 'package:mobx/mobx.dart';
part 'hotel_controller.g.dart';

class HotelController = _HotelControllerBase with _$HotelController;

abstract class _HotelControllerBase with Store {
  @observable
  Hotel hotel;
}
