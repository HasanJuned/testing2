class ReadProfileUser {
  int? id;
  String? email;
  String? otp;
  String? createdAt;
  String? updatedAt;

  ReadProfileUser({
    this.id,
    this.email,
    this.otp,
    this.createdAt,
    this.updatedAt,
  });

  ReadProfileUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
