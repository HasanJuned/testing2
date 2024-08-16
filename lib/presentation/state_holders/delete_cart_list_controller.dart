import 'package:crafty_bay/data/models/delete_product_list_data.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class DeleteCartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  DeleteProductListData? _deleteCartListResponse;
  bool get inProgress => _inProgress;
  DeleteProductListData? get deleteCartListResponse => _deleteCartListResponse;
  String get errorMessage => _errorMessage;

  Future<bool> deleteCarList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.deleteCartList(productId));

    if (response.isSuccess) {
      if (response.responseData['msg'] == 'successful') {
        _deleteCartListResponse =
            DeleteProductListData.fromJson(response.responseData);
        isSuccess = true;
      } else {
        _errorMessage = response.responseData['msg'] ?? 'errors happened';
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
