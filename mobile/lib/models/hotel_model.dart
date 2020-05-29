class Hotel {
  int id;
  String name;
  String address;
  String imageUrl;
  int price;
  String phone;
  Null createdAt;
  Null updatedAt;

  Hotel(
      {this.id,
      this.name,
      this.address,
      this.imageUrl,
      this.price,
      this.phone,
      this.createdAt,
      this.updatedAt});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    phone = json['phone'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
