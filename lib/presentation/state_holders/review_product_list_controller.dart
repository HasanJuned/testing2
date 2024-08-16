import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/review_list_by_product_model.dart';
import 'package:crafty_bay/data/models/review_product_list_data.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReviewProductListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<ReviewProductListData> _reviewProductListData = [];

  bool get inProgress => _inProgress;

  List<ReviewProductListData> get reviewProductListData =>
      _reviewProductListData;

  String get errorMessage => _errorMessage;

  Future<bool> getReviewProductList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.listReviewByProduct(productId));
    if (response.isSuccess) {
      _reviewProductListData =
          ReviewListByProductModel.fromJson(response.responseData)
                  .reviewProductList ??
              [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
