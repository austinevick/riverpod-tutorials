class Vitals {
  String? vitalsSecondaryValue;
  String? sId;
  String? vitalsKey;
  String? vitalsDefaultValue;
  String? unit;
  String? description;
  String? title, timestamp;

  Vitals(
      {this.vitalsSecondaryValue,
      this.sId,
      this.vitalsKey,
      this.vitalsDefaultValue,
      this.unit,
      this.description,
      this.title,
      this.timestamp});

  Vitals.fromJson(Map<String, dynamic> json, String time) {
    vitalsSecondaryValue = json['vitals_secondary_value'];
    sId = json['_id'];
    vitalsKey = json['vitals_key'];
    vitalsDefaultValue = json['vitals_default_value'];
    unit = json['unit'];
    description = json['description'];
    title = json['title'];
    timestamp = time;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vitals_secondary_value'] = vitalsSecondaryValue;
    data['_id'] = sId;
    data['vitals_key'] = vitalsKey;
    data['vitals_default_value'] = vitalsDefaultValue;
    data['unit'] = unit;
    data['description'] = description;
    data['title'] = title;
    data['timestamp'] = timestamp;
    return data;
  }
}
