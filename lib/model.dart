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
  List<Member>? member;
  String? createdDate;

  Data(
      {this.sId,
        this.batch,
        this.section,
        this.courseCode,
        this.courseTitle,
        this.member,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    batch = json['batch'];
    section = json['section'];
    courseCode = json['courseCode'];
    courseTitle = json['courseTitle'];
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(new Member.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['batch'] = this.batch;
    data['section'] = this.section;
    data['courseCode'] = this.courseCode;
    data['courseTitle'] = this.courseTitle;
    if (this.member != null) {
      data['member'] = this.member!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class Member {
  String? name;
  String? batch;
  String? department;
  String? section;
  String? sId;
  String? timestamp;

  Member(
      {this.name,
        this.batch,
        this.department,
        this.section,
        this.sId,
        this.timestamp});

  Member.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    batch = json['batch'];
    department = json['department'];
    section = json['section'];
    sId = json['_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['batch'] = this.batch;
    data['department'] = this.department;
    data['section'] = this.section;
    data['_id'] = this.sId;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
