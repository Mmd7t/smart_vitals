class AddRating {
  int rate;
  int patientId;
  int doctorId;
  String desc;

  AddRating({
    this.rate,
    this.desc,
    this.patientId,
    this.doctorId,
  });

  factory AddRating.fromJson(Map<String, dynamic> json) => AddRating(
        rate: json['rate'],
        patientId: json['patient_id'],
        doctorId: json['doctor_id'],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "desc": desc,
      };
}

class AddRatingResponse {
  AddRatingResponse({
    this.error,
    this.response,
  });

  Error error;
  Response response;

  factory AddRatingResponse.fromJson(Map<String, dynamic> json) =>
      AddRatingResponse(
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
    this.doctorId,
    this.rate,
    this.desc,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int patientId;
  int doctorId;
  int rate;
  String desc;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        rate: json["rate"],
        desc: json["desc"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "rate": rate,
        "desc": desc,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}

class GetRating {
  GetRating({
    this.error,
    this.response,
  });

  Error error;
  double response;

  factory GetRating.fromJson(Map<String, dynamic> json) => GetRating(
        error: Error.fromJson(json["Error"]),
        response: json["Response"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Error": error.toJson(),
        "Response": response,
      };
}
