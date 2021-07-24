class BloodPressureCreate {
  int systolic;
  int diastolic;
  int patientId;
  String desc;

  BloodPressureCreate(
      {this.systolic, this.diastolic, this.patientId, this.desc});

  factory BloodPressureCreate.fromJson(Map<String, dynamic> json) =>
      BloodPressureCreate(
        systolic: json['systolic'],
        diastolic: json['diastolic'],
        desc: json['desc'],
        patientId: json['patient_id'],
      );

  Map<String, dynamic> toJson() => {
        "systolic": systolic,
        "diastolic": diastolic,
        "desc": desc,
        "patient_id": patientId,
      };
}

class BloodPressureCreateResponse {
  BloodPressureCreateResponse({this.error, this.response});

  BloodPressureError error;
  BloodPressureResponse response;

  factory BloodPressureCreateResponse.fromJson(Map<String, dynamic> json) =>
      BloodPressureCreateResponse(
        error: BloodPressureError.fromJson(json["Error"]),
        response: BloodPressureResponse.fromJson(json["Response"]),
      );

  Map<String, dynamic> toJson() => {
        "Error": error.toJson(),
        "Response": response.toJson(),
      };
}

class BloodPressureError {
  BloodPressureError({
    this.status,
    this.token,
    this.code,
    this.validation,
    this.desc,
  });

  bool status;
  dynamic token;
  int code;
  List<dynamic> validation;
  String desc;

  factory BloodPressureError.fromJson(Map<String, dynamic> json) =>
      BloodPressureError(
        status: json["status"],
        token: json["token"],
        code: json["code"],
        validation: List<dynamic>.from(json["validation"].map((x) => x)),
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "code": code,
        "validation": List<dynamic>.from(validation.map((x) => x)),
        "desc": desc,
      };
}

class BloodPressureResponse {
  BloodPressureResponse({
    this.systolic,
    this.diastolic,
    this.patientId,
    this.desc,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int systolic;
  int diastolic;
  int patientId;
  String desc;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory BloodPressureResponse.fromJson(Map<String, dynamic> json) =>
      BloodPressureResponse(
        systolic: json["systolic"],
        diastolic: json["diastolic"],
        patientId: json["patient_id"],
        desc: json["desc"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "systolic": systolic,
        "diastolic": diastolic,
        "patient_id": patientId,
        "desc": desc,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
