import 'package:get/get.dart';
import 'package:testing2/urls.dart';

import 'j.dart';
import 'model.dart';
import 'network_response.dart';


class FacRegistrationController extends GetxController {
  bool _facRegInProgress = false;
  String _message = '';
  FacRegData _facRegData = FacRegData();

  bool get facRegInProgress => _facRegInProgress;
  String get message => _message;
  FacRegData get facRegData => _facRegData;

  Future<bool> facReg(String email) async {
    _facRegInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.facultyReg,
      {"email": email},
    );
    _facRegInProgress = false;
    if (response.isSuccess) {
      _facRegData =
      FacRegistrationModel.fromJson(response.responseJson ?? {}).data!;
      return true;
    } else {
      _message = 'Failed to create profile';
      return false;
    }
  }
}