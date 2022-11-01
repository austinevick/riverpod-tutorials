class MedicalCredentialResponse {
  int? status;
  bool? response;
  Data? data;
  String? message;
  String? errMessage;

  MedicalCredentialResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  MedicalCredentialResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    errMessage = json['errMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['response'] = response;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['errMessage'] = errMessage;
    return data;
  }
}

class Data {
  List<MedicalCredentials>? medicalCredentials;

  Data({this.medicalCredentials});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['medical_credentials'] != null) {
      medicalCredentials = [];
      json['medical_credentials'].forEach((v) {
        medicalCredentials!.add(MedicalCredentials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medicalCredentials != null) {
      data['medical_credentials'] =
          medicalCredentials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicalCredentials {
  String? description;
  String? status;
  String? title;
  String? subtitle;
  String? key;
  int? iV;

  MedicalCredentials(
      {this.description,
      this.status,
      this.title,
      this.subtitle,
      this.key,
      this.iV});

  MedicalCredentials.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    status = json['status'];
    title = json['title'];
    subtitle = json['subtitle'];
    key = json['key'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['status'] = status;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['key'] = key;
    data['__v'] = iV;
    return data;
  }
}
