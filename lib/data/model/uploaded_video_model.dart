class UploadedVideoModel {
  List<Data>? data;

  UploadedVideoModel({this.data});

  UploadedVideoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? fileType;
  String? timestamp;

  Data({this.sId, this.fileType, this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fileType = json['fileType'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fileType'] = this.fileType;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
