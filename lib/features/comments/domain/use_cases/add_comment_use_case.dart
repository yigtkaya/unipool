import 'package:injectable/injectable.dart';
import 'package:unipool/features/comments/domain/models/comment_model.dart';
import 'package:unipool/features/comments/domain/repository/comment_repository.dart';

@injectable
final class AddCommentUseCase {
  final CommentsRepository repository;

  AddCommentUseCase(this.repository);

  Future<CommentModel> call() {
    return repository.addComment();
  }
}
