import 'package:provider_dio/models/comment_model.dart';
import 'package:provider_dio/repository/comments_repository.dart';
import 'package:provider_dio/repository/jsonplaceholder_custon_dio.dart';

class CommentsDioRepsositoy implements CommentsRepository {
  final JsonPlaceHolderCustonDio jsonPlaceHolderCustonDio;

  CommentsDioRepsositoy(this.jsonPlaceHolderCustonDio);
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response =
        await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
