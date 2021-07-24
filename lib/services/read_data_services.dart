import 'package:dio/dio.dart';
import 'package:smart_vitans/models/illness_model.dart' hide Response;
import 'package:smart_vitans/models/medicine_model.dart' hide Response;
import 'package:smart_vitans/models/read_data/blood_pressure_create_model.dart';
import 'package:smart_vitans/models/read_data/glucose_create_model.dart'
    hide Response;

class ReadDataServices {
  /*-------------------------------------------------------------------------------------------------*/
  /*-------------------------------------  BloodPressureCreate  -------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<bool> bloodPressureCreate(BloodPressureCreate data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/create/blood_pressure'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      BloodPressureCreateResponse res =
          BloodPressureCreateResponse.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'Blood Pressure Created Successfully') {
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
    }
    return result;
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*----------------------------------------  GlucoseCreate  ----------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<bool> glucoseCreate(GlucoseHeartTempCreate data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/create/blood_sugar'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      GlucoseHeartTempCreateResponse res =
          GlucoseHeartTempCreateResponse.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'Blood Sugar Created Successfully') {
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
    }
    return result;
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*---------------------------------------  HeartRateCreate  ---------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<bool> heartRateCreate(GlucoseHeartTempCreate data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/create/heart_rate'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      GlucoseHeartTempCreateResponse res =
          GlucoseHeartTempCreateResponse.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'Heart Rate Created Successfully') {
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
    }
    return result;
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*--------------------------------------  TemperatureCreate  --------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<bool> temperatureCreate(GlucoseHeartTempCreate data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/create/temperature'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      GlucoseHeartTempCreateResponse res =
          GlucoseHeartTempCreateResponse.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'Temperature Created Successfully') {
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
    }
    return result;
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*---------------------------------------  MedicineCreate  ----------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<bool> medicineCreate(MedicineCreate data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/create/medicine'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      MedicineResponse res = MedicineResponse.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'Medicine Created Successfully') {
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
    }
    return result;
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*----------------------------------------  IllnessCreate  ----------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<bool> illnessCreate(IllnessCreate data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/create/illness'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      IllnessResponse res = IllnessResponse.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'Illness Created Successfully') {
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
    }
    return result;
  }
}
