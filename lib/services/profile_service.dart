import 'package:dio/dio.dart';
import 'package:smart_vitans/models/user_profile_model.dart' hide Response;

class ProfileService {
  static Future<UserProfileModel> profile(id) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.getUri(
        Uri.parse(
            'https://gradproject54.000webhostapp.com/api/user/profile?user_id=$id'),
        options: Options(contentType: 'application/json'),
      );
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr Profile');
      throw e;
    }
    return UserProfileModel.fromJson(response.data);
  }
}
