class ConsultationResponse {
  String? message;
  int? statusCode;
  bool? error;
  List<Data>? data;

  ConsultationResponse({this.message, this.statusCode, this.error, this.data});

  ConsultationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? job;
  String? appointmentDate;
  int? duration;
  Details? details;

  Data(
      {this.name, this.job, this.appointmentDate, this.duration, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    appointmentDate = json['appointment_date'];
    duration = json['duration'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['appointment_date'] = this.appointmentDate;
    data['duration'] = this.duration;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? physician;
  String? gender;
  String? job;
  String? complaint;
  LinkedDocs? linkedDocs;

  Details(
      {this.physician, this.gender, this.job, this.complaint, this.linkedDocs});

  Details.fromJson(Map<String, dynamic> json) {
    physician = json['physician'];
    gender = json['gender'];
    job = json['Job'];
    complaint = json['complaint'];
    linkedDocs = json['linked_docs'] != null
        ? new LinkedDocs.fromJson(json['linked_docs'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['physician'] = this.physician;
    data['gender'] = this.gender;
    data['Job'] = this.job;
    data['complaint'] = this.complaint;
    if (this.linkedDocs != null) {
      data['linked_docs'] = this.linkedDocs!.toJson();
    }
    return data;
  }
}

class LinkedDocs {
  String? fileName;
  String? fileSize;
  String? link;

  LinkedDocs({this.fileName, this.fileSize, this.link});

  LinkedDocs.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'];
    fileSize = json['file_size'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_name'] = this.fileName;
    data['file_size'] = this.fileSize;
    data['link'] = this.link;
    return data;
  }
}