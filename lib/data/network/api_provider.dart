import 'package:ecommerce_app_login/data/constant/endpoints.dart';
import 'package:ecommerce_app_login/data/network/api_client.dart';
import 'package:ecommerce_app_login/domain/models/event_users.dart';
import 'package:ecommerce_app_login/domain/models/photo_model.dart';
import 'package:ecommerce_app_login/domain/models/posts_model.dart';
import 'package:ecommerce_app_login/utils/tools.dart';

class ApiProvider {
  final ApiClient client = ApiClient();

  Future<List<PhotosModel>> getPhotos() async {
    try {
      final response = await client.get(Endpoints.photos);
      final list = photosModelFromJson(response);

      return list;
    } catch (e) {
      Tools.showSnack(e.toString());
      return [];
    }
  }

  Future<List<EventUsersModel>> getEventUsers() async {
    try {
      final response = await client.get(Endpoints.eventUsers);
      final list = eventUsersModelFromJson(response);

      return list;
    } catch (e) {
      Tools.showSnack(e.toString());
      return [];
    }
  }

  Future<List<PostsModel>> getPosts() async {
    try {
      final response = await client.get(Endpoints.postsList);
      final list = postsModelFromJson(response);

      return list;
    } catch (e) {
      Tools.showSnack(e.toString());
      return [];
    }
  }
}
