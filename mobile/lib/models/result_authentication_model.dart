class ResultAuthentication {
  String type;
  String token;
  Null refreshToken;

  ResultAuthentication({this.type, this.token, this.refreshToken});

  ResultAuthentication.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
