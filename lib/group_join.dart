class GroupJoin {
  String? status;
  Data? data;

  GroupJoin({this.status, this.data});

  GroupJoin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? batch;
  String? section;
  String? courseCode;
  String? courseTitle;
  String? email;
  List<Member>? member;
  String? createdDate;
  String? sId;

  Data(
      {this.batch,
        this.section,
        this.courseCode,
        this.courseTitle,
        this.email,
        this.member,
        this.createdDate,
        this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    batch = json['batch'];
    section = json['section'];
    courseCode = json['courseCode'];
    courseTitle = json['courseTitle'];
    email = json['email'];
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(new Member.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batch'] = this.batch;
    data['section'] = this.section;
    data['courseCode'] = this.courseCode;
    data['courseTitle'] = this.courseTitle;
    data['email'] = this.email;
    if (this.member != null) {
      data['member'] = this.member!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    data['_id'] = this.sId;
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
