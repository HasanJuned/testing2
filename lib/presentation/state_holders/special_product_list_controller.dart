import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product.dart';
import 'package:crafty_bay/data/models/product_list_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductListController extends GetxController {
  bool _specialProductInProgress = false;

  List<Product> _specialProductList = [];

  String _errorMessage = '';

  bool get specialProductInProgress => _specialProductInProgress;

  List<Product> get specialProductList => _specialProductList;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _specialProductInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByRemark('Special'));

    if (response.isSuccess) {
      _specialProductList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _specialProductInProgress = false;
    update();
    return isSuccess;
  }
}
