import 'package:mobile/models/destination_model.dart';
import 'package:mobx/mobx.dart';
part 'destination_controller.g.dart';

class DestinationController = _DestinationControllerBase
    with _$DestinationController;

abstract class _DestinationControllerBase with Store {
  @observable
  Destination destinations;
  _DestinationControllerBase();
}
