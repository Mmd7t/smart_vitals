import 'package:dio/dio.dart';
import 'package:smart_vitans/models/rating_model.dart' hide Response;

class RatingServices {
  /*-------------------------------------------------------------------------------------------------*/
  /*------------------------------------------  AddRating  ------------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<bool> addRating(AddRating data) async {
    Dio dio = Dio();
    bool result = false;
    try {
      Response<Map<String, dynamic>> response = await dio.postUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/create/rating'),
          data: data.toJson(),
          options: Options(contentType: 'application/json'));

      AddRatingResponse res = AddRatingResponse.fromJson(response.data);
      print(res.error.code);
      if (res.error.code == 200 &&
          res.error.desc == 'Rating Added Successfully') {
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
  /*------------------------------------------  GetRating  ------------------------------------------*/
  /*-------------------------------------------------------------------------------------------------*/
  static Future<GetRating> getRating(doctorId) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
          Uri.parse(
              'https://gradproject54.000webhostapp.com/api/rating?doctor_id=$doctorId'),
          options: Options(contentType: 'application/json'));

      if (response.statusCode == 200) {
        final GetRating userProfileModel = GetRating.fromJson(response.data);
        return userProfileModel;
      } else {
        return null;
      }
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhh455');
      throw {'status code': response.statusCode, 'errror': e};
    }
  }
}
