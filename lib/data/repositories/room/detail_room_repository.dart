import 'package:dio/dio.dart';
import 'package:itera_monitoring_ac/data/base/base_url.dart';
import 'package:itera_monitoring_ac/data/model/room/detail_room.dart';
import 'package:itera_monitoring_ac/utils/type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomRepository {
  var dio = Dio();

  Future<DetailRoomModel> getDetailRoom(dynamic id) async {
    try {
      final pref = await SharedPreferences.getInstance();
      var token = pref.getString(tTOKEN) ?? '';

      var response = await dio.get("${baseUrl}rooms/$id",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      return DetailRoomModel.fromMap(response.data);
    } catch (e) {
      Map<String, dynamic> error = {
        "status": 500,
        "message": "ERROR",
        "data": {
          "id": "",
          "name": "",
          "description": "",
          "images": "",
          "status": "",
          "people_count": 0,
          "firebase": [],
          "createdAt": "string",
          "updatedAt": "string"
        }
      };
      return DetailRoomModel.fromMap(error);
    }
  }
}
