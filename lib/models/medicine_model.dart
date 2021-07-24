class MedicineCreate {
  String name;
  int patientId;
  int dose;
  int timesPerDay;
  String desc;
  String start;
  String end;

  MedicineCreate(
      {this.name,
      this.desc,
      this.dose,
      this.end,
      this.patientId,
      this.start,
      this.timesPerDay});

  factory MedicineCreate.fromJson(Map<String, dynamic> json) => MedicineCreate(
        name: json['name'],
        patientId: json['patient_id'],
        dose: json['dose'],
        timesPerDay: json['times_per_day'],
        desc: json['desc'],
        start: json['start'],
        end: json['end'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "patient_id": patientId,
        "dose": dose,
        "times_per_day": timesPerDay,
        "desc": desc,
        "start": start,
        "end": end,
      };
}

class MedicineResponse {
  MedicineResponse({
    this.error,
    this.response,
  });

  Error error;
  Response response;

  factory MedicineResponse.fromJson(Map<String, dynamic> json) =>
      MedicineResponse(
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
    this.name,
    this.patientId,
    this.dose,
    this.timesPerDay,
    this.desc,
    this.start,
    this.end,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String name;
  int patientId;
  int dose;
  int timesPerDay;
  String desc;
  String start;
  String end;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        name: json["name"],
        patientId: json["patient_id"],
        dose: json["dose"],
        timesPerDay: json["times_per_day"],
        desc: json["desc"],
        start: json["start"],
        end: json["end"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "patient_id": patientId,
        "dose": dose,
        "times_per_day": timesPerDay,
        "desc": desc,
        "start": start,
        "end": end,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
