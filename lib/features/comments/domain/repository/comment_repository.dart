import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/features/comments/domain/models/comment_model.dart';

part '../../data/comment_repository_impl.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> getComments(String userId);
  Future<CommentModel> addComment();
  Future<void> deleteComment(String commentId);
}
