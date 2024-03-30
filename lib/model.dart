class FacRegistrationModel {
  String? status;
  FacRegData? data;

  FacRegistrationModel({this.status, this.data});

  FacRegistrationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? FacRegData.fromJson(json['data']) : null;
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

class FacRegData {
  String? email;
  String? fullName;
  String? designation;
  String? department;
  String? password;
  String? createdDate;
  String? sId;

  FacRegData(
      {this.email,
        this.fullName,
        this.designation,
        this.department,
        this.password,
        this.createdDate,
        this.sId});

  FacRegData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    designation = json['designation'];
    department = json['department'];
    password = json['password'];
    createdDate = json['createdDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullName'] = fullName;
    data['designation'] = designation;
    data['department'] = department;
    data['password'] = password;
    data['createdDate'] = createdDate;
    data['_id'] = sId;
    return data;
  }
}