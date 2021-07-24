class BloodPressureListModel {
  BloodPressureListModel({
    this.error,
    this.response,
  });

  Error error;
  List<Response> response;

  factory BloodPressureListModel.fromJson(Map<String, dynamic> json) =>
      BloodPressureListModel(
        error: Error.fromJson(json["Error"]),
        response: List<Response>.from(
            json["Response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Error": error.toJson(),
        "Response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Error {
  Error({
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

  factory Error.fromJson(Map<String, dynamic> json) => Error(
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

class Response {
  Response({
    this.id,
    this.patientId,
    this.systolic,
    this.diastolic,
    this.desc,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int patientId;
  int systolic;
  int diastolic;
  String desc;
  DateTime createdAt;
  DateTime updatedAt;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        patientId: json["patient_id"],
        systolic: json["systolic"],
        diastolic: json["diastolic"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "systolic": systolic,
        "diastolic": diastolic,
        "desc": desc,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class MeasuresListModel {
  MeasuresListModel({
    this.error,
    this.response,
  });

  Error error;
  List<MeasuresResponse> response;

  factory MeasuresListModel.fromJson(Map<String, dynamic> json) =>
      MeasuresListModel(
        error: Error.fromJson(json["Error"]),
        response: List<MeasuresResponse>.from(
            json["Response"].map((x) => MeasuresResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Error": error.toJson(),
        "Response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class MeasuresResponse {
  MeasuresResponse({
    this.id,
    this.patientId,
    this.value,
    this.desc,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int patientId;
  int value;
  dynamic desc;
  DateTime createdAt;
  DateTime updatedAt;

  factory MeasuresResponse.fromJson(Map<String, dynamic> json) =>
      MeasuresResponse(
        id: json["id"],
        patientId: json["patient_id"],
        value: json["value"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "value": value,
        "desc": desc,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
