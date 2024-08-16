import 'package:crafty_bay/data/models/delete_product_list_data.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class DeleteWishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;

  DeleteProductListData? _deleteWishListResponse;
  DeleteProductListData? get deleteWishListResponse => _deleteWishListResponse;

  Future<bool> deleteWishList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.removeWishList(productId));

    if (response.isSuccess) {
      if (response.responseData['msg'] == 'successful') {
        _deleteWishListResponse =
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
