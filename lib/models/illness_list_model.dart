class IllnessListModel {
  IllnessListModel({
    this.error,
    this.response,
  });

  Error error;
  List<Response> response;

  factory IllnessListModel.fromJson(Map<String, dynamic> json) =>
      IllnessListModel(
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
    this.diagnoses,
    this.start,
    this.end,
    this.notes,
    this.symptoms,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int patientId;
  String diagnoses;
  String start;
  String end;
  String notes;
  String symptoms;
  DateTime createdAt;
  DateTime updatedAt;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        patientId: json["patient_id"],
        diagnoses: json["diagnoses"],
        start: json["start"],
        end: json["end"],
        notes: json["notes"],
        symptoms: json["symptoms"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "diagnoses": diagnoses,
        "start": start,
        "end": end,
        "notes": notes,
        "symptoms": symptoms,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
