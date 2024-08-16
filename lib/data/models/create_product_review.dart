class CreateProductReview {
  String? description;
  int? productId;
  int? rating;

  CreateProductReview({this.description, this.productId, this.rating});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['product_id'] = productId;
    data['rating'] = rating;
    return data;
  }
}
