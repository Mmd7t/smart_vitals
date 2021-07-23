import 'package:dio/dio.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/registration_model.dart' hide Response;
import 'package:smart_vitans/shared_prefs.dart';

class RegistrationServices {
  static Future<bool> register(RegistrationModel data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/user/register'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      AuthResponseModel res = AuthResponseModel.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'User Registered Successfully') {
        SharedPrefsHelper.saveIdToPrefs(res.response.id);
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
    }
    return result;
  }

  static Future<bool> login(LoginModel data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse('https://gradproject54.000webhostapp.com/api/user/login'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      AuthResponseModel res = AuthResponseModel.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'User Logged In Successfully') {
        SharedPrefsHelper.saveIdToPrefs(res.response.id);
        Constants.userId = res.response.id;
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
