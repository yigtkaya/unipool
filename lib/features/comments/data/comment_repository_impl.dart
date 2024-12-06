part of '../domain/repository/comment_repository.dart';

@Injectable(as: CommentsRepository)
class CommentsRepositoryImpl extends CommentsRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<CommentModel> addComment() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteComment(String commentId) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentModel>> getComments(String userId) async {
    try {
      final response = await supabase.from('reviews').select('*').eq('to', userId);

      if (response.isEmpty) {
        return <CommentModel>[];
      }

      final commentsList = (response as List)
          .map(
            (e) => CommentModelMapper.fromMap(e as Map<String, dynamic>),
          )
          .toList();
      return commentsList;
    } on StorageException {
      return <CommentModel>[];
    }
  }
}
