import 'package:provider_dio/models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}
