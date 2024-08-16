import 'package:crafty_bay/data/models/read_profile_user.dart';

class ReadProfile {
  int? id;
  String? cusName;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  String? cusPostcode;
  String? cusCountry;
  String? cusPhone;
  String? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  String? shipState;
  String? shipPostcode;
  String? shipCountry;
  String? shipPhone;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ReadProfileUser? user;

  ReadProfile({
    this.id,
    this.cusName,
    this.cusAdd,
    this.cusCity,
    this.cusState,
    this.cusPostcode,
    this.cusCountry,
    this.cusPhone,
    this.cusFax,
    this.shipName,
    this.shipAdd,
    this.shipCity,
    this.shipState,
    this.shipPostcode,
    this.shipCountry,
    this.shipPhone,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  ReadProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
    cusAdd = json['cus_add'];
    cusCity = json['cus_city'];
    cusState = json['cus_state'];
    cusPostcode = json['cus_postcode'];
    cusCountry = json['cus_country'];
    cusPhone = json['cus_phone'];
    cusFax = json['cus_fax'];
    shipName = json['ship_name'];
    shipAdd = json['ship_add'];
    shipCity = json['ship_city'];
    shipState = json['ship_state'];
    shipPostcode = json['ship_postcode'];
    shipCountry = json['ship_country'];
    shipPhone = json['ship_phone'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? ReadProfileUser.fromJson(json['user']) : null;
  }
}
