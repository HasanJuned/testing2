import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:crafty_bay/data/models/read_profile.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  ReadProfile? _readProfile;

  bool get inProgress => _inProgress;

  ReadProfile? get readProfile => _readProfile;

  String get errorMessage => _errorMessage;

  Future<bool> getReadProfileList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.readProfile);
    if (response.isSuccess) {
      _readProfile =
          ReadProfileModel.fromJson(response.responseData).readProfile;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
