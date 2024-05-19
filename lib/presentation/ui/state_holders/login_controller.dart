import 'package:get/get.dart';

import '../../../data/model/login_model.dart';
import '../../../data/model/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import 'auth_controller.dart';


class LoginController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  LoginModel _loginModel = LoginModel();

  bool get inProgress => _inProgress;
  String get message => _message;
  LoginModel get loginModel => _loginModel;

  Future<bool> login(String number, String password) async {
    _inProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.postRequest(Urls.login, {
      "number": number,
      "password": password,
    });
    await AuthController.setAccessToken(response.responseJson?['token']);
    await AuthController.setIsPaid(response.responseJson?['data'][0]['isPaid']);
    await AuthController.setProfileDetails(
      response.responseJson!['data'][0]['fullName'].toString(),
      response.responseJson!['data'][0]['number'].toString(),
      response.responseJson!['data'][0]['address'].toString(),
      response.responseJson!['data'][0]['email'].toString(),
      response.responseJson!['data'][0]['password'].toString()
    );
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _loginModel = LoginModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = 'Failed';
      return false;
    }
  }
}