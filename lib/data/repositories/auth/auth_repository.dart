import 'package:dio/dio.dart';
import 'package:itera_monitoring_ac/data/base/base_url.dart';
import 'package:itera_monitoring_ac/data/model/auth/login_model.dart';
import 'package:itera_monitoring_ac/utils/type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  var dio = Dio();

  Future<LoginModel> postLogin(String email, String password) async {
    final pref = await SharedPreferences.getInstance();
    print(email + password);

    Map formdata = {"email": email, "password": password};

    try {
      var response = await dio.post(
        "${baseUrl}users/signin",
        data: formdata,
        options: Options(
          headers: {"accept": "*/*", "Content-Type": "application/json"},
        ),
      );

      print(response);

      var result = LoginModel.fromMap(response.data);

      await pref.setString(tTOKEN, result.data.token);

      return result;
    } catch (e) {
      print("erros nih boxx");
      print(e);

      Map<String, dynamic> error = {
        "status": 400,
        "message": "Error",
        "data": {
          "id": -1,
          "firstName": "",
          "lastName": "",
          "email": "",
          "token": "nill"
        }
      };

      return LoginModel.fromMap(error);
    }
  }
}
