import 'package:provider_dio/models/comment_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> retornaComentarios(int postId);
}
