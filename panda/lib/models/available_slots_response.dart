class AvailableSlotsResponse {
  int? status;
  bool? response;
  Data? data;
  String? message;
  String? errMessage;

  AvailableSlotsResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  AvailableSlotsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Timeslots>? timeslots;
  String? nextAvailableSlot;

  Data({this.timeslots, this.nextAvailableSlot});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['timeslots'] != null) {
      timeslots = [];
      json['timeslots'].forEach((v) {
        timeslots!.add(Timeslots.fromJson(v));
      });
    }
    nextAvailableSlot = json['next_available_slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (timeslots != null) {
      data['timeslots'] = timeslots!.map((v) => v.toJson()).toList();
    }
    data['next_available_slot'] = nextAvailableSlot;
    return data;
  }
}

class Timeslots {
  String? slotTime;
  String? slotDate;

  Timeslots({this.slotTime, this.slotDate});

  Timeslots.fromJson(Map<String, dynamic> json) {
    slotTime = json['slot_time'];
    slotDate = json['slot_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot_time'] = slotTime;
    data['slot_date'] = slotDate;
    return data;
  }
}
