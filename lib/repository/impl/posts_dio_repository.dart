import 'package:provider_dio/models/post_model.dart';
import 'package:provider_dio/repository/posts_repository.dart';
import 'package:provider_dio/repository/jsonplaceholder_custon_dio.dart';

class PostsDioRepository implements PostsRepository {
  final JsonPlaceHolderCustonDio jsonPlaceHolderCustonDio;
  PostsDioRepository(this.jsonPlaceHolderCustonDio);
  @override
  Future<List<PostModel>> getPosts() async {
    var response = await jsonPlaceHolderCustonDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
