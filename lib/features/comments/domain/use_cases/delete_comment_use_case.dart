import 'package:injectable/injectable.dart';
import 'package:unipool/features/comments/domain/repository/comment_repository.dart';

@injectable
final class DeleteCommentUseCase {
  final CommentsRepository repository;

  DeleteCommentUseCase(this.repository);

  Future<void> call(String commentId) {
    return repository.deleteComment(commentId);
  }
}
