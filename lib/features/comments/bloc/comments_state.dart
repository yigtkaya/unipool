part of 'comments_bloc.dart';

final class CommentsState extends Equatable {
  final List<CommentModel> comments;
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;

  const CommentsState({
    this.comments = const [],
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [comments, isLoading, hasError, errorMessage];

  CommentsState copyWith({
    List<CommentModel>? comments,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) {
    return CommentsState(
      comments: comments ?? this.comments,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
