class UserProfileModel {
  UserProfileModel({
    this.error,
    this.response,
  });

  Error error;
  Response response;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
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
    this.id,
    this.name,
    this.age,
    this.gender,
    this.email,
    this.mobile,
    this.speciality,
    this.rating,
    this.city,
    this.address,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.doctorId,
    this.partnerId,
    this.patients,
  });

  int id;
  String name;
  dynamic age;
  String gender;
  String email;
  int mobile;
  String speciality;
  int rating;
  String city;
  String address;
  int type;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic doctorId;
  dynamic partnerId;
  List patients;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        mobile: json["mobile"],
        speciality: json["speciality"],
        rating: json["rating"],
        city: json["city"],
        address: json["address"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctorId: json["doctor_id"],
        partnerId: json["partner_id"],
        patients: json["patients"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": gender,
        "email": email,
        "mobile": mobile,
        "speciality": speciality,
        "rating": rating,
        "city": city,
        "address": address,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctor_id": doctorId,
        "partner_id": partnerId,
        "patients": patients,
      };
}
