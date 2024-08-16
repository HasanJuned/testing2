import 'package:crafty_bay/data/models/read_profile.dart';

class ReadProfileModel {
  String? msg;
  ReadProfile? readProfile;

  ReadProfileModel({this.msg, this.readProfile});

  ReadProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    readProfile =
        json['data'] != null ? ReadProfile.fromJson(json['data']) : null;
  }
}
