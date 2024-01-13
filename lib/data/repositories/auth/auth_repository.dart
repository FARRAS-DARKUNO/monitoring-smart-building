import 'package:dio/dio.dart';
import 'package:itera_monitoring_ac/data/base/base_url.dart';
import 'package:itera_monitoring_ac/data/model/auth/login_model.dart';

class AuthRepository {
  var dio = Dio();

  Future<LoginModel> postLoagin(String email, String password) async {
    FormData formdata =
        FormData.fromMap({"email": email, "password": password});

    try {
      var response = await dio.post(
        "${baseUrl}users/signin",
        data: formdata,
      );

      return LoginModel.fromMap(response.data);
    } catch (e) {
      Map<String, dynamic> error = {
        "status": 400,
        "message": "User signed in successfully",
        "data": {}
      };
      return LoginModel.fromMap(error);
    }
  }
}
