import 'package:injectable/injectable.dart';
import 'package:unipool/features/comments/domain/models/comment_model.dart';
import 'package:unipool/features/comments/domain/repository/comment_repository.dart';

@injectable
final class FetchCommentsUseCase {
  final CommentsRepository repository;

  FetchCommentsUseCase(this.repository);

  Future<List<CommentModel>> call(String postId) {
    return repository.getComments(postId);
  }
}
