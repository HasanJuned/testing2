class LoginModel {
  String? status;
  List<Data>? data;
  String? token;

  LoginModel({this.status, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  String? sId;
  String? fullName;
  String? number;
  String? address;
  String? email;
  String? password;
  String? isPaid;
  String? timestamp;

  Data(
      {this.sId,
        this.fullName,
        this.number,
        this.address,
        this.email,
        this.password,
        this.isPaid,
        this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    number = json['number'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    isPaid = json['isPaid'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['number'] = number;
    data['address'] = address;
    data['email'] = email;
    data['password'] = password;
    data['isPaid'] = isPaid;
    data['timestamp'] = timestamp;
    return data;
  }
}
