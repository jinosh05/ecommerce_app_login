import 'package:ecommerce_app_login/data/constant/endpoints.dart';
import 'package:ecommerce_app_login/data/network/api_client.dart';
import 'package:ecommerce_app_login/domain/models/event_users.dart';
import 'package:ecommerce_app_login/domain/models/photo_model.dart';
import 'package:ecommerce_app_login/utils/tools.dart';

class ApiProvider {
  final ApiClient client = ApiClient();

  Future<List<PhotosModel>> getPhotos() async {
    try {
      var response = await client.get(Endpoints.photos);
      var list = photosModelFromJson(response);

      return list;
    } catch (e) {
      Tools.showSnack(e.toString());
      return [];
    }
  }

  Future<List<EventUsersModel>> getEventUsers() async {
    try {
      var response = await client.get(Endpoints.eventUsers);
      var list = eventUsersModelFromJson(response);

      return list;
    } catch (e) {
      Tools.showSnack(e.toString());
      return [];
    }
  }
}
