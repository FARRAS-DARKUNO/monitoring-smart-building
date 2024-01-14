import 'package:dio/dio.dart';
import 'package:itera_monitoring_ac/data/base/base_url.dart';
import 'package:itera_monitoring_ac/data/model/room/room_model.dart';
import 'package:itera_monitoring_ac/utils/type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomRepository {
  var dio = Dio();

  Future<RoomModel> getRoomList() async {
    try {
      final pref = await SharedPreferences.getInstance();
      var token = pref.getString(tTOKEN) ?? '';

      var response = await dio.get("${baseUrl}rooms",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      return RoomModel.fromMap(response.data);
    } catch (e) {
      Map<String, dynamic> error = {
        "status": 200,
        "message": "error",
        "data": []
      };
      return RoomModel.fromMap(error);
    }
  }
}
