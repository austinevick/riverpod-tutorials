class LabObj {
  String? sId;
  String? labKey;
  int? labDefaultValue;
  int? labSecondaryValue;
  String? unit;
  String? description;
  String? labName;

  LabObj(
      {this.sId,
      this.labKey,
      this.labDefaultValue,
      this.labSecondaryValue,
      this.unit,
      this.description,
      this.labName});

  LabObj.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    labKey = json['lab_key'];
    labDefaultValue = json['lab_default_value'];
    labSecondaryValue = json['lab_secondary_value'];
    unit = json['unit'];
    description = json['description'];
    labName = json['lab_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['lab_key'] = labKey;
    data['lab_default_value'] = labDefaultValue;
    data['lab_secondary_value'] = labSecondaryValue;
    data['unit'] = unit;
    data['description'] = description;
    data['lab_name'] = labName;
    return data;
  }
}
