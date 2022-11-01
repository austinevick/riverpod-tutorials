class AddLabResultResponse {
  int? status;
  bool? response;
  Data? data;
  String? message;
  String? errMessage;

  AddLabResultResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  AddLabResultResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = '${json['message']}';
    errMessage = '${json['errMessage']}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['response'] = response;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['errMessage'] = '${errMessage}';
    return data;
  }
}

class Data {
  String? source;
  String? comment;
  String? sId;
  String? dateEntered;
  String? timestamp;
  List<LabTests>? labTests;
  String? userId;
  String? observerId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.source,
      this.comment,
      this.sId,
      this.dateEntered,
      this.timestamp,
      this.labTests,
      this.userId,
      this.observerId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    comment = json['comment'];
    sId = json['_id'];
    dateEntered = json['date_entered'];
    timestamp = json['timestamp'];
    if (json['lab_tests'] != null) {
      labTests = [];
      json['lab_tests'].forEach((v) {
        labTests!.add(LabTests.fromJson(v));
      });
    }
    userId = json['user_id'];
    observerId = json['observer_id'];
    createdBy = json['created_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['comment'] = comment;
    data['_id'] = sId;
    data['date_entered'] = dateEntered;
    data['timestamp'] = timestamp;
    if (labTests != null) {
      data['lab_tests'] = labTests!.map((v) => v.toJson()).toList();
    }
    data['user_id'] = userId;
    data['observer_id'] = observerId;
    data['created_by'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class LabTests {
  String? labSecondaryValue;
  String? sId;
  String? labKey;
  String? labDefaultValue;
  String? unit;
  String? description;
  String? labName;

  LabTests(
      {this.labSecondaryValue,
      this.sId,
      this.labKey,
      this.labDefaultValue,
      this.unit,
      this.description,
      this.labName});

  LabTests.fromJson(Map<String, dynamic> json) {
    labSecondaryValue = json['lab_secondary_value'].toString();
    sId = json['_id'].toString();
    labKey = json['lab_key'].toString();
    labDefaultValue = json['lab_default_value'].toString();
    unit = json['unit'].toString();
    description = json['description'].toString();
    labName = json['lab_name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lab_secondary_value'] = labSecondaryValue;
    data['_id'] = sId;
    data['lab_key'] = labKey;
    data['lab_default_value'] = labDefaultValue;
    data['unit'] = unit;
    data['description'] = description;
    data['lab_name'] = labName;
    return data;
  }
}
