import 'package:get/get.dart';
import 'package:testing2/data/model/sign_up_model.dart';

import '../../../data/model/login_model.dart';
import '../../../data/model/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';


class SignUpController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  SignUpModel _signUpModel = SignUpModel();

  bool get inProgress => _inProgress;
  String get message => _message;
  SignUpModel get signUpModel => _signUpModel;

  Future<bool> singUp(String fullName, String number, String address, String email, String password) async {
    _inProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.postRequest(Urls.signUp, {
      "fullName": fullName,
      "number": number,
      "address": address,
      "email": email,
      "password": password,
    });
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _signUpModel = SignUpModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = 'Failed';
      return false;
    }
  }
}