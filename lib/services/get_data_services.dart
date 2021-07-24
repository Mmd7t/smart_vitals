import 'package:dio/dio.dart';
import 'package:smart_vitans/models/get_data_model.dart' hide Response;
import 'package:smart_vitans/models/get_medicine_model.dart' hide Response;
import 'package:smart_vitans/models/illness_list_model.dart' hide Response;

class GetDateServices {
  /*-------------------------------------------------------------------------------------------------*/
  /*-------------------------------------  GetBloodPressureList  ------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<BloodPressureListModel> getBloodPressureList(patientId) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/blood_pressure?patient_id=$patientId'),
          options: Options(contentType: 'application/json'));

      if (response.statusCode == 200) {
        final BloodPressureListModel bloodPressureList =
            BloodPressureListModel.fromJson(response.data);
        return bloodPressureList;
      } else {
        return null;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
      throw {'status code': response.statusCode, 'errror': e};
    }
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*----------------------------------------  GetGlucoseList  ---------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<MeasuresListModel> getGlucoseList(patientId) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/blood_sugar?patient_id=$patientId'),
          options: Options(contentType: 'application/json'));

      if (response.statusCode == 200) {
        final MeasuresListModel glucoseList =
            MeasuresListModel.fromJson(response.data);
        return glucoseList;
      } else {
        return null;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
      throw {'status code': response.statusCode, 'errror': e};
    }
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*---------------------------------------  GetHeartRateList  --------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<MeasuresListModel> getHeartRateList(patientId) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/heart_rate?patient_id=$patientId'),
          options: Options(contentType: 'application/json'));

      if (response.statusCode == 200) {
        final MeasuresListModel heartRateList =
            MeasuresListModel.fromJson(response.data);
        return heartRateList;
      } else {
        return null;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
      throw {'status code': response.statusCode, 'errror': e};
    }
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*--------------------------------------  GetTemperatureList  -------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<MeasuresListModel> getTemperatureList(patientId) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/temperature?patient_id=$patientId'),
          options: Options(contentType: 'application/json'));

      if (response.statusCode == 200) {
        final MeasuresListModel temperatureList =
            MeasuresListModel.fromJson(response.data);
        return temperatureList;
      } else {
        return null;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
      throw {'status code': response.statusCode, 'errror': e};
    }
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*---------------------------------------  GetMedicineList  ---------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<MedicineListModel> getMedicineList(patientId) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/medicine?patient_id=$patientId'),
          options: Options(contentType: 'application/json'));

      if (response.statusCode == 200) {
        final MedicineListModel medicineList =
            MedicineListModel.fromJson(response.data);
        return medicineList;
      } else {
        return null;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
      throw {'status code': response.statusCode, 'errror': e};
    }
  }

  /*-------------------------------------------------------------------------------------------------*/
  /*---------------------------------------  GetIllnessList  ----------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<IllnessListModel> getIllnessList(patientId) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/illness?patient_id=$patientId'),
          options: Options(contentType: 'application/json'));

      if (response.statusCode == 200) {
        final IllnessListModel illnessList =
            IllnessListModel.fromJson(response.data);
        return illnessList;
      } else {
        return null;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
      throw {'status code': response.statusCode, 'errror': e};
    }
  }
}
