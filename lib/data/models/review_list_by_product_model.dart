import 'package:crafty_bay/data/models/review_product_list_data.dart';

class ReviewListByProductModel {
  String? msg;
  List<ReviewProductListData>? reviewProductList;

  ReviewListByProductModel({this.msg, this.reviewProductList});

  ReviewListByProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewProductList = <ReviewProductListData>[];
      json['data'].forEach((v) {
        reviewProductList!.add(ReviewProductListData.fromJson(v));
      });
    }
  }
}
