class GlucoseHeartTempCreate {
  int value;
  int patientId;

  GlucoseHeartTempCreate({this.value, this.patientId});

  factory GlucoseHeartTempCreate.fromJson(Map<String, dynamic> json) =>
      GlucoseHeartTempCreate(
        value: json['value'],
        patientId: json['patient_id'],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "patient_id": patientId,
      };
}

class GlucoseHeartTempCreateResponse {
  GlucoseHeartTempCreateResponse({
    this.error,
    this.response,
  });

  Error error;
  Response response;

  factory GlucoseHeartTempCreateResponse.fromJson(Map<String, dynamic> json) =>
      GlucoseHeartTempCreateResponse(
        error: Error.fromJson(json["Error"]),
        response: Response.fromJson(json["Response"]),
      );

  Map<String, dynamic> toJson() => {
        "Error": error.toJson(),
        "Response": response.toJson(),
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
    this.patientId,
    this.value,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int patientId;
  int value;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        patientId: json["patient_id"],
        value: json["value"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "value": value,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
