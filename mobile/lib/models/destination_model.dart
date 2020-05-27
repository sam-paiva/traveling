import 'package:mobile/models/hotel_model.dart';

class Destination {
  int id;
  String imageUrl;
  String city;
  String country;
  Null createdAt;
  Null updatedAt;
  List<Hotel> hotels = [];

  Destination(
      {this.id,
      this.imageUrl,
      this.city,
      this.country,
      this.createdAt,
      this.updatedAt,
      this.hotels});

  Destination.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    imageUrl = json['imageUrl'] as String;
    city = json['city'] as String;
    country = json['country'] as String;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hotels = (json['hotels'] as List).map((i) {
      return Hotel.fromJson(i);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['city'] = this.city;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['hotels'] = this.hotels;
    return data;
  }
}
