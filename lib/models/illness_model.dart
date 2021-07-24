class IllnessCreate {
  String diagnoses;
  int patientId;
  int dose;
  String symptoms;
  String start;
  String end;
  String notes;

  IllnessCreate(
      {this.diagnoses,
      this.symptoms,
      this.dose,
      this.end,
      this.patientId,
      this.start,
      this.notes});

  factory IllnessCreate.fromJson(Map<String, dynamic> json) => IllnessCreate(
        diagnoses: json['diagnoses'],
        patientId: json['patient_id'],
        dose: json['dose'],
        symptoms: json['symptoms'],
        start: json['start'],
        end: json['end'],
        notes: json['notes'],
      );

  Map<String, dynamic> toJson() => {
        "diagnoses": diagnoses,
        "patient_id": patientId,
        "dose": dose,
        "symptoms": symptoms,
        "start": start,
        "end": end,
        "notes": notes,
      };
}

class IllnessResponse {
  IllnessResponse({
    this.error,
    this.response,
  });

  Error error;
  Response response;

  factory IllnessResponse.fromJson(Map<String, dynamic> json) =>
      IllnessResponse(
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
    this.diagnoses,
    this.start,
    this.end,
    this.symptoms,
    this.notes,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int patientId;
  String diagnoses;
  String start;
  String end;
  String symptoms;
  String notes;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        patientId: json["patient_id"],
        diagnoses: json["diagnoses"],
        start: json["start"],
        end: json["end"],
        symptoms: json["symptoms"],
        notes: json["notes"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "diagnoses": diagnoses,
        "start": start,
        "end": end,
        "symptoms": symptoms,
        "notes": notes,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
