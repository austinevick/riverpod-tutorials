class PhysicianResponse {
  int? status;
  bool? response;
  Data? data;
  String? message;
  String? errMessage;

  PhysicianResponse(
      {this.status, this.response, this.data, this.message, this.errMessage});

  PhysicianResponse.fromJson(Map<String, dynamic> json) {
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
  List<Physicians>? physicians;

  Data({this.physicians});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['physicians'] != null) {
      physicians = [];
      json['physicians'].forEach((v) {
        physicians!.add(Physicians.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (physicians != null) {
      data['physicians'] = physicians!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Physicians {
  Specialty? specialty;
  String? title;
  String? userId;
  int? iV;
  List<Subspecialty>? subspecialty;
  List<Credentials>? credentials;
  String? titles;
  String? startedPractice;
  List<dynamic>? documents;
  UserInfo? userInfo;
  List<dynamic>? ratingsInfo;
  List<dynamic>? feedback;
  String? practiceInfo;
  String? id;

  Physicians(
      {this.specialty,
      this.title,
      this.titles,
      this.userId,
      this.iV,
      this.subspecialty,
      this.credentials,
      this.startedPractice,
      this.documents,
      this.userInfo,
      this.ratingsInfo,
      this.feedback,
      this.practiceInfo,
      this.id});

  Physicians.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'] != null
        ? Specialty.fromJson(json['specialty'])
        : null;
    title = json['title'];
    userId = json['user_id'];
    iV = json['__v'];
    if (json['subspecialty'] != null) {
      subspecialty = [];
      json['subspecialty'].forEach((v) {
        subspecialty!.add(Subspecialty.fromJson(v));
      });
    }
    titles = '';
    if (json['credentials'] != null) {
      credentials = [];
      json['credentials'].forEach((v) {
        var cred = Credentials.fromJson(v);
        credentials!.add(cred);
        titles = '${titles!}${cred.title}, ';
      });
    }
    startedPractice = json['started_practice'];
    // if (json['documents'] != null) {
    //   documents = List<Null>();
    //   json['documents'].forEach((v) {
    //     documents.add(Null.fromJson(v));
    //   });
    // }
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
    // if (json['ratings_info'] != null) {
    //   ratingsInfo = List<Null>();
    //   json['ratings_info'].forEach((v) {
    //     ratingsInfo.add(Null.fromJson(v));
    //   });
    // }
    // if (json['feedback'] != null) {
    //   feedback = List<Null>();
    //   json['feedback'].forEach((v) {
    //     feedback.add(Null.fromJson(v));
    //   });
    // }
    practiceInfo = json['practice_info'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (specialty != null) {
      data['specialty'] = specialty!.toJson();
    }
    data['title'] = title;
    data['user_id'] = userId;
    data['__v'] = iV;
    if (subspecialty != null) {
      data['subspecialty'] = subspecialty!.map((v) => v.toJson()).toList();
    }
    if (credentials != null) {
      data['credentials'] = credentials!.map((v) => v.toJson()).toList();
    }
    data['started_practice'] = startedPractice;
    // if (this.documents != null) {
    //   data['documents'] = this.documents.map((v) => v.toJson()).toList();
    // }
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    // if (this.ratingsInfo != null) {
    //   data['ratings_info'] = this.ratingsInfo.map((v) => v.toJson()).toList();
    // }
    // if (this.feedback != null) {
    //   data['feedback'] = this.feedback.map((v) => v.toJson()).toList();
    // }
    data['practice_info'] = practiceInfo;
    data['id'] = id;
    return data;
  }
}

class Specialty {
  String? title;
  String? field;

  Specialty({this.title, this.field});

  Specialty.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    field = json['field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['field'] = field;
    return data;
  }
}

class Subspecialty {
  String? sId;
  String? title;
  String? field;

  Subspecialty({this.sId, this.title, this.field});

  Subspecialty.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    field = json['field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['field'] = field;
    return data;
  }
}

class Credentials {
  String? sId;
  String? key;
  String? type;
  String? title;

  Credentials({this.sId, this.key, this.type, this.title});

  Credentials.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    key = json['key'];
    type = json['type'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['key'] = key;
    data['type'] = type;
    data['title'] = title;
    return data;
  }
}

class UserInfo {
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
  String? createdAt;
  String? email;
  String? phone;
  String? firstName;
  String? username;
  String? country;
  String? gender;
  String? dateOfBirth;
  String? lastSeen;
  String? updatedAt;
  int? iV;
  String? id;

  UserInfo(
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
      this.createdAt,
      this.email,
      this.phone,
      this.firstName,
      this.username,
      this.country,
      this.gender,
      this.dateOfBirth,
      this.lastSeen,
      this.updatedAt,
      this.iV,
      this.id});

  UserInfo.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['createdAt'];
    email = json['email'];
    phone = json['phone'];
    firstName = json['firstName'];
    username = json['username'];
    country = json['country'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    lastSeen = json['lastSeen'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['createdAt'] = createdAt;
    data['email'] = email;
    data['phone'] = phone;
    data['firstName'] = firstName;
    data['username'] = username;
    data['country'] = country;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['lastSeen'] = lastSeen;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}
