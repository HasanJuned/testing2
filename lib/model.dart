class Model {
  String? status;
  List<Data>? data;

  Model({this.status, this.data});

  Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? batch;
  String? section;
  String? courseCode;
  String? courseTitle;
  String? email;
  String? createdDate;

  Data(
      {this.sId,
        this.batch,
        this.section,
        this.courseCode,
        this.courseTitle,
        this.email,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    batch = json['batch'];
    section = json['section'];
    courseCode = json['courseCode'];
    courseTitle = json['courseTitle'];
    email = json['email'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['batch'] = this.batch;
    data['section'] = this.section;
    data['courseCode'] = this.courseCode;
    data['courseTitle'] = this.courseTitle;
    data['email'] = this.email;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
