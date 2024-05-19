class SignUpModel {
  String? status;
  Data? data;

  SignUpModel({this.status, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? fullName;
  String? number;
  String? address;
  String? email;
  String? password;
  String? isPaid;
  String? sId;
  String? timestamp;

  Data(
      {this.fullName,
        this.number,
        this.address,
        this.email,
        this.password,
        this.isPaid,
        this.sId,
        this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    number = json['number'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    isPaid = json['isPaid'];
    sId = json['_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['number'] = number;
    data['address'] = address;
    data['email'] = email;
    data['password'] = password;
    data['isPaid'] = isPaid;
    data['_id'] = sId;
    data['timestamp'] = timestamp;
    return data;
  }
}
