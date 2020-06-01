import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/repositories/traveling_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final api = Modular.get<TravelingRepository>();

  @observable
  String token;

  @observable
  User user;

  @action
  Future<bool> login(String email, String password) async {
    try {
      token = await api.login(email, password);
      if (token != '' || token != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }

  @action
  void getUser(String email) async {
    try {
      user = await api.getUserByEmail(email);
    } catch (e) {
      throw e;
    }
  }
}
