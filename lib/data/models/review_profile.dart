class ReviewProfile {
  int? id;
  String? cusName;

  ReviewProfile({this.id, this.cusName});

  ReviewProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }
}
