class DynamicDataModel {
  DynamicDataModel({
    required this.type,
    this.value,
    this.datetype,
    this.datevalue,
  });
  factory DynamicDataModel.fromJson(Map<String, dynamic> json) {
    return DynamicDataModel(
      type: json['type'],
      value: json['value'],
      datetype: json['datetype'],
      datevalue: json['datevalue'],
    );
  }

  final String type;
  final String? value;
  final String? datetype;
  final String? datevalue;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
      'datetype': datetype,
      'datevalue': datevalue,
    };
  }
}
