class AppointmentsResponse {
  int? status;
  bool? response;
  Data? data;
  String? message;
  String? errMessage;

  AppointmentsResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  AppointmentsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Appointments>? appointments;

  Data({this.appointments});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointments {
  String? sId;
  Appointee? appointee;
  Appointee? scheduler;
  Timeslots? timeslots;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Appointments(
      {this.sId,
      this.appointee,
      this.scheduler,
      this.timeslots,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Appointments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    appointee = json['appointee'] != null
        ? Appointee.fromJson(json['appointee'])
        : null;
    scheduler = json['scheduler'] != null
        ? Appointee.fromJson(json['scheduler'])
        : null;
    timeslots = json['timeslots'] != null
        ? Timeslots.fromJson(json['timeslots'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (appointee != null) {
      data['appointee'] = appointee!.toJson();
    }
    if (scheduler != null) {
      data['scheduler'] = scheduler!.toJson();
    }
    if (timeslots != null) {
      data['timeslots'] = timeslots!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Appointee {
  String? profilePic;
  String? lastName;
  String? role;
  bool? isOnline;
  String? sId;
  String? email;
  String? phone;
  String? firstName;
  String? username;
  String? gender;
  String? dateOfBirth;
  String? lastSeen;
  int? iV;
  String? id;

  Appointee(
      {this.profilePic,
      this.lastName,
      this.role,
      this.isOnline,
      this.sId,
      this.email,
      this.phone,
      this.firstName,
      this.username,
      this.gender,
      this.dateOfBirth,
      this.lastSeen,
      this.iV,
      this.id});

  Appointee.fromJson(Map<String, dynamic> json) {
    profilePic = json['profilePic'];
    lastName = json['lastName'];
    role = json['role'];
    isOnline = json['isOnline'];
    sId = json['_id'];
    email = json['email'];
    phone = json['phone'];
    firstName = json['firstName'];
    username = json['username'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    lastSeen = json['lastSeen'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profilePic'] = profilePic;
    data['lastName'] = lastName;
    data['role'] = role;
    data['isOnline'] = isOnline;
    data['_id'] = sId;
    data['email'] = email;
    data['phone'] = phone;
    data['firstName'] = firstName;
    data['username'] = username;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['lastSeen'] = lastSeen;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}

class Timeslots {
  bool? isActive;
  bool? isOverdue;
  bool? isClosed;
  String? status;
  String? sId;
  String? slotTime;
  String? slotDate;
  String? appointeeId;
  int? iV;

  Timeslots(
      {this.isActive,
      this.isOverdue,
      this.isClosed,
      this.status,
      this.sId,
      this.slotTime,
      this.slotDate,
      this.appointeeId,
      this.iV});

  Timeslots.fromJson(Map<String, dynamic> json) {
    isActive = json['isActive'];
    isOverdue = json['isOverdue'];
    isClosed = json['isClosed'];
    status = json['status'];
    sId = json['_id'];
    slotTime = json['slot_time'];
    slotDate = json['slot_date'];
    appointeeId = json['appointee_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isActive'] = isActive;
    data['isOverdue'] = isOverdue;
    data['isClosed'] = isClosed;
    data['status'] = status;
    data['_id'] = sId;
    data['slot_time'] = slotTime;
    data['slot_date'] = slotDate;
    data['appointee_id'] = appointeeId;
    data['__v'] = iV;
    return data;
  }
}
