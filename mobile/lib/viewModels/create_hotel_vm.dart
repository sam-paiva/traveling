import 'dart:io';

class CreateHotelViewModel {
  String name;
  String address;
  File imageBase64;
  String phone;
  String city;
  int userId;
  double price;

  CreateHotelViewModel(
      {this.name,
      this.address,
      this.imageBase64,
      this.phone,
      this.city,
      this.price,
      this.userId});
}
