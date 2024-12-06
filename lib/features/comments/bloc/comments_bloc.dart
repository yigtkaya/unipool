import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/comments/domain/models/comment_model.dart';
import 'package:unipool/features/comments/domain/use_cases/add_comment_use_case.dart';
import 'package:unipool/features/comments/domain/use_cases/delete_comment_use_case.dart';
import 'package:unipool/features/comments/domain/use_cases/fetch_comments_use_case.dart';

part 'comments_event.dart';
part 'comments_state.dart';

@injectable
final class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final FetchCommentsUseCase _fetchCommentsUseCase;
  final AddCommentUseCase _addCommentUseCase;
  final DeleteCommentUseCase _deleteCommentUseCase;

  CommentsBloc({
    required FetchCommentsUseCase fetchCommentsUseCase,
    required AddCommentUseCase addCommentUseCase,
    required DeleteCommentUseCase deleteCommentUseCase,
  })  : _fetchCommentsUseCase = fetchCommentsUseCase,
        _addCommentUseCase = addCommentUseCase,
        _deleteCommentUseCase = deleteCommentUseCase,
        super(CommentsState()) {
    on<FetchComments>(_onFetchComments);
    on<AddComment>(_onAddComment);
    on<DeleteComment>(_onDeleteComment);
  }

  Future<void> _onFetchComments(
    FetchComments event,
    Emitter<CommentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final comments = await _fetchCommentsUseCase.call(event.postId);
      emit(
        state.copyWith(
          comments: comments,
          isLoading: false,
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: err.toString(),
        ),
      );
    }
  }

  Future<void> _onAddComment(
    AddComment event,
    Emitter<CommentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final newComment = await _addCommentUseCase.call(); // TODO
      final updatedComments = [...state.comments, newComment];
      emit(
        state.copyWith(
          comments: updatedComments,
          isLoading: false,
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: err.toString(),
        ),
      );
    }
  }

  Future<void> _onDeleteComment(
    DeleteComment event,
    Emitter<CommentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await _deleteCommentUseCase.call(event.commentId);
      final updatedComments = state.comments.where((comment) => comment.id != event.commentId).toList();
      emit(
        state.copyWith(
          comments: updatedComments,
          isLoading: false,
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: err.toString(),
        ),
      );
    }
  }
}
