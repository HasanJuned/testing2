class DeleteProductListData {
  String? msg;
  int? data;

  DeleteProductListData({this.msg, this.data});

  DeleteProductListData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'];
  }
}
