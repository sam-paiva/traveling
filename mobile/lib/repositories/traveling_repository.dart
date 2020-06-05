import 'package:dio/dio.dart';
import 'package:mobile/models/destination_model.dart';
import 'package:mobile/models/hotel_model.dart';
import 'package:mobile/models/result_authentication_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/viewModels/create_hotel_vm.dart';

class TravelingRepository {
  final Dio _dio = Dio();

  String url = 'http://192.168.11.6:3333'; //Url para emulador

  Future<List<Destination>> getDestinations() async {
    try {
      Response response = await _dio.get('$url/destinations');

      if (response.statusCode != 200) {
        throw Exception();
      } else {
        return (response.data as List)
            .map((item) => Destination.fromJson(item))
            .toList();
      }
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Hotel>> getHotels() async {
    Response response = await _dio.get('$url/hotels');

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      var results =
          (response.data as List).map((i) => new Hotel.fromJson(i)).toList();

      return results;
    }
  }

  Future<String> login(String email, String password) async {
    FormData formData = new FormData.fromMap({
      "email": email,
      "password": password,
    });

    Response response = await _dio.post('$url/sessions', data: formData);

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      var result = ResultAuthentication.fromJson(response.data);

      return result.token;
    }
  }

  Future<User> getUserByEmail(String email) async {
    Response response = await _dio.get('$url/users?email=' + email);

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      var result = User.fromJson(response.data);

      return result;
    }
  }

  Future<bool> storeHotel(CreateHotelViewModel model) async {
    FormData formData = new FormData.fromMap({
      "name": model.name,
      "address": model.address,
      "price": model.price,
      "phone": model.phone,
      "city": model.city,
      "userId": model.userId,
      "imageBase64": await MultipartFile.fromFile(model.imageBase64.path,
          filename: model.name)
    });

    Response response = await _dio.post('$url/hotels', data: formData);

    if (response.statusCode != 204) {
      return false;
    } else {
      return true;
    }
  }
}
