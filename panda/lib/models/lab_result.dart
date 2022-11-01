class LabResult {
  ResultSource? resultSource;
  String? description;
  dynamic unit;
  String? sId;
  String? title;
  String? key;
  int? iV;

  LabResult(
      {this.resultSource,
      this.description,
      this.unit,
      this.sId,
      this.title,
      this.key,
      this.iV});

  LabResult.fromJson(Map<String, dynamic> json) {
    resultSource = json['result_source'] != null
        ? ResultSource.fromJson(json['result_source'])
        : null;
    description = json['description'];
    unit = json['unit'];
    sId = json['_id'];
    title = json['title'];
    key = json['key'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultSource != null) {
      data['result_source'] = resultSource!.toJson();
    }
    data['description'] = description;
    data['unit'] = unit;
    data['_id'] = sId;
    data['title'] = title;
    data['key'] = key;
    data['__v'] = iV;
    return data;
  }
}

class ResultSource {
  String? patient;
  String? physician;
  String? lab;
  String? clinic;

  ResultSource({this.patient, this.physician, this.lab, this.clinic});

  ResultSource.fromJson(Map<String, dynamic> json) {
    patient = json['patient'];
    physician = json['physician'];
    lab = json['lab'];
    clinic = json['clinic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient'] = patient;
    data['physician'] = physician;
    data['lab'] = lab;
    data['clinic'] = clinic;
    return data;
  }
}
