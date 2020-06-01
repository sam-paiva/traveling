import 'package:dio/dio.dart';
import 'package:mobile/models/destination_model.dart';
import 'package:mobile/models/hotel_model.dart';
import 'package:mobile/models/result_authentication_model.dart';
import 'package:mobile/models/user_model.dart';

class TravelingRepository {
  final Dio _dio = Dio();

  String url = 'http://10.0.2.2:3333';

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
}
