class LabResultHistoryResponse {
  int? status;
  bool? response;
  List<LabResultData>? data;
  String? message;
  String? errMessage;

  LabResultHistoryResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  LabResultHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    if (json['data'] != null) {
      data = <LabResultData>[];
      json['data'].forEach((v) {
        data!.add(LabResultData.fromJson(v));
      });
    }
    message = '${json['message']}';
    errMessage = '${json['errMessage']}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['response'] = response;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['errMessage'] = errMessage;
    return data;
  }
}

class LabResultData {
  String? source;
  String? comment;
  String? sId;
  String? dateEntered;
  String? timestamp;
  List<LabTests>? labTests;
  String? userId;
  String? observerId;
  String? createdBy;
  int? iV;

  LabResultData(
      {this.source,
      this.comment,
      this.sId,
      this.dateEntered,
      this.timestamp,
      this.labTests,
      this.userId,
      this.observerId,
      this.createdBy,
      this.iV});

  LabResultData.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    comment = json['comment'];
    sId = json['_id'];
    dateEntered = json['date_entered'];
    timestamp = json['timestamp'];
    if (json['lab_tests'] != null) {
      labTests = <LabTests>[];
      json['lab_tests'].forEach((v) {
        labTests!.add(LabTests.fromJson(v));
      });
    }
    userId = json['user_id'];
    observerId = json['observer_id'];
    createdBy = json['created_by'];
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
    sId = json['_id'];
    labKey = json['lab_key'].toString();
    labDefaultValue = json['lab_default_value'].toString();
    unit = json['unit'];
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
