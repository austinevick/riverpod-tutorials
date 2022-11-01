import 'vital_obj.dart';

class VitalHistoryResponse {
  int? status;
  bool? response;
  List<VitalHistoryData>? data;
  String? message;
  String? errMessage;

  VitalHistoryResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  VitalHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    if (json['data'] != null) {
      data = <VitalHistoryData>[];
      json['data'].forEach((v) {
        data!.add(VitalHistoryData.fromJson(v));
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

class VitalHistoryData {
  String? sId;
  String? source;
  String? comment;
  String? dateEntered;
  String? timestamp;
  String? userId;
  String? observerId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  List<Vitals>? vitals;
  int? iV;

  VitalHistoryData(
      {this.sId,
      this.source,
      this.comment,
      this.dateEntered,
      this.timestamp,
      this.userId,
      this.observerId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.vitals,
      this.iV});

  VitalHistoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    source = json['source'];
    comment = json['comment'];
    dateEntered = json['date_entered'];
    timestamp = json['timestamp'];
    userId = json['user_id'];
    observerId = json['observer_id'];
    createdBy = json['created_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['vitals'] != null) {
      vitals = [];
      json['vitals'].forEach((v) {
        vitals!.add(Vitals.fromJson(v, timestamp!));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['source'] = source;
    data['comment'] = comment;
    data['date_entered'] = dateEntered;
    data['timestamp'] = timestamp;
    data['user_id'] = userId;
    data['observer_id'] = observerId;
    data['created_by'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (vitals != null) {
      data['vitals'] = vitals!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}
