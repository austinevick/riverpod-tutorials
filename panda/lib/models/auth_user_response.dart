class AuthUserResponse {
  int? status;
  bool? response;
  Data? data;
  String? message;
  String? errMessage;

  AuthUserResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  AuthUserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    errMessage = json['errMessage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? profilePic;
  String? qrcode;
  String? lastName;
  String? ip;
  String? device;
  String? inviteCode;
  String? invitedBy;
  String? role;
  String? street;
  String? city;
  String? state;
  bool? isActive;
  String? deviceToken;
  bool? isOnline;
  String? unitSystem;
  String? sId;
  String? firstName;
  String? email;
  String? gender;
  String? createdAt;
  String? dateOfBirth;
  String? phone;
  String? username;
  String? lastSeen;
  String? updatedAt;
  String? iV;
  Vitals? vitals;
  String? id;

  User(
      {this.profilePic,
      this.qrcode,
      this.lastName,
      this.ip,
      this.device,
      this.inviteCode,
      this.invitedBy,
      this.role,
      this.street,
      this.city,
      this.state,
      this.isActive,
      this.deviceToken,
      this.isOnline,
      this.unitSystem,
      this.sId,
      this.firstName,
      this.email,
      this.gender,
      this.createdAt,
      this.dateOfBirth,
      this.phone,
      this.username,
      this.lastSeen,
      this.updatedAt,
      this.iV,
      this.vitals,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    profilePic = json['profilePic'];
    qrcode = json['qrcode'];
    lastName = json['lastName'];
    ip = json['ip'];
    device = json['device'];
    inviteCode = json['inviteCode'];
    invitedBy = json['invitedBy'];
    role = json['role'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    isActive = json['isActive'];
    deviceToken = json['deviceToken'];
    isOnline = json['isOnline'];
    unitSystem = json['unit_system'];
    sId = json['_id'];
    firstName = json['firstName'];
    email = json['email'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    dateOfBirth = json['dateOfBirth'];
    phone = json['phone'];
    username = json['username'];
    lastSeen = json['lastSeen'];
    updatedAt = json['updatedAt'];
    iV = "${json['__v']}";
    vitals = json['vitals'] != null ? Vitals.fromJson(json['vitals']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['profilePic'] = profilePic;
    data['qrcode'] = qrcode;
    data['lastName'] = lastName;
    data['ip'] = ip;
    data['device'] = device;
    data['inviteCode'] = inviteCode;
    data['invitedBy'] = invitedBy;
    data['role'] = role;
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['isActive'] = isActive;
    data['deviceToken'] = deviceToken;
    data['isOnline'] = isOnline;
    data['unit_system'] = unitSystem;
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['email'] = email;
    data['gender'] = gender;
    data['createdAt'] = createdAt;
    data['dateOfBirth'] = dateOfBirth;
    data['phone'] = phone;
    data['username'] = username;
    data['lastSeen'] = lastSeen;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (vitals != null) {
      data['vitals'] = vitals!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Vitals {
  Temperature? temperature;
  BloodPressure? bloodPressure;
  Temperature? height;
  Temperature? weight;
  Temperature? bmi;
  Temperature? oxygenSaturation;
  Temperature? respirationRate;
  HeartRate? heartRate;
  Bsa? bsa;

  Vitals(
      {this.temperature,
      this.bloodPressure,
      this.height,
      this.weight,
      this.bmi,
      this.oxygenSaturation,
      this.respirationRate,
      this.heartRate,
      this.bsa});

  Vitals.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'] != null
        ? Temperature.fromJson(json['temperature'])
        : null;
    bloodPressure = json['blood_pressure'] != null
        ? BloodPressure.fromJson(json['blood_pressure'])
        : null;
    height =
        json['height'] != null ? Temperature.fromJson(json['height']) : null;
    weight =
        json['weight'] != null ? Temperature.fromJson(json['weight']) : null;
    bmi = json['bmi'] != null ? Temperature.fromJson(json['bmi']) : null;
    oxygenSaturation = json['oxygen_saturation'] != null
        ? Temperature.fromJson(json['oxygen_saturation'])
        : null;
    respirationRate = json['respiration_rate'] != null
        ? Temperature.fromJson(json['respiration_rate'])
        : null;
    heartRate = json['heart_rate'] != null
        ? HeartRate.fromJson(json['heart_rate'])
        : null;
    bsa = json['bsa'] != null ? Bsa.fromJson(json['bsa']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (temperature != null) {
      data['temperature'] = temperature!.toJson();
    }
    if (bloodPressure != null) {
      data['blood_pressure'] = bloodPressure!.toJson();
    }
    if (height != null) {
      data['height'] = height!.toJson();
    }
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    if (bmi != null) {
      data['bmi'] = bmi!.toJson();
    }
    if (oxygenSaturation != null) {
      data['oxygen_saturation'] = oxygenSaturation!.toJson();
    }
    if (respirationRate != null) {
      data['respiration_rate'] = respirationRate!.toJson();
    }
    if (heartRate != null) {
      data['heart_rate'] = heartRate!.toJson();
    }
    if (bsa != null) {
      data['bsa'] = bsa!.toJson();
    }
    return data;
  }
}

class Temperature {
  String? value;
  String? unit;
  String? numberOfRecords;
  String? latestRecord;

  Temperature({this.value, this.unit, this.numberOfRecords, this.latestRecord});

  Temperature.fromJson(Map<String, dynamic> json) {
    value = "${json['value']}";
    unit = json['unit'];
    numberOfRecords = "${json['number_of_records']}";
    latestRecord = json['latest_record'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    data['number_of_records'] = numberOfRecords;
    data['latest_record'] = latestRecord;
    return data;
  }
}

class BloodPressure {
  String? systolic;
  String? diastolic;
  String? unit;
  String? numberOfRecords;
  String? latestRecord;
  History? history;

  BloodPressure(
      {this.systolic,
      this.diastolic,
      this.unit,
      this.numberOfRecords,
      this.latestRecord,
      this.history});

  BloodPressure.fromJson(Map<String, dynamic> json) {
    systolic = json['systolic'].toString();
    diastolic = json['diastolic'].toString();
    unit = json['unit'];
    numberOfRecords = json['number_of_records'].toString();
    latestRecord = json['latest_record'];
    history =
        json['history'] != null ? History.fromJson(json['history']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['systolic'] = systolic;
    data['diastolic'] = diastolic;
    data['unit'] = unit;
    data['number_of_records'] = numberOfRecords;
    data['latest_record'] = latestRecord;
    if (history != null) {
      data['history'] = history!.toJson();
    }
    return data;
  }
}

class History {
  String? low;
  String? normal;
  String? high;
  String? average;

  History({this.low, this.normal, this.high, this.average});

  History.fromJson(Map<String, dynamic> json) {
    low = json['low'].toString();
    normal = json['normal'].toString();
    high = json['high'].toString();
    average = json['average'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['low'] = low;
    data['normal'] = normal;
    data['high'] = high;
    data['average'] = average;
    return data;
  }
}

class HeartRate {
  String? value;
  String? unit;
  String? numberOfRecords;
  String? latestRecord;
  History? history;

  HeartRate(
      {this.value,
      this.unit,
      this.numberOfRecords,
      this.latestRecord,
      this.history});

  HeartRate.fromJson(Map<String, dynamic> json) {
    value = json['value'].toString();
    unit = json['unit'];
    numberOfRecords = json['number_of_records'].toString();
    latestRecord = json['latest_record'];
    history =
        json['history'] != null ? History.fromJson(json['history']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    data['number_of_records'] = numberOfRecords;
    data['latest_record'] = latestRecord;
    if (history != null) {
      data['history'] = history!.toJson();
    }
    return data;
  }
}

class Bsa {
  String? value;
  String? unit;
  String? numberOfRecords;
  String? latestRecord;

  Bsa({this.value, this.unit, this.numberOfRecords, this.latestRecord});

  Bsa.fromJson(Map<String, dynamic> json) {
    value = json['value'].toString();
    unit = json['unit'];
    numberOfRecords = json['number_of_records'].toString();
    latestRecord = json['latest_record'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    data['number_of_records'] = numberOfRecords;
    data['latest_record'] = latestRecord;
    return data;
  }
}
