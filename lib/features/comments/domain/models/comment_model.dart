import 'package:dart_mappable/dart_mappable.dart';

part 'comment_model.mapper.dart';

@MappableClass()
class CommentModel with CommentModelMappable {
  const CommentModel({
    required this.id,
    @MappableField(key: 'created_at') required this.createdAt,
    required this.comment,
    required this.from,
    required this.to,
    @MappableField(key: 'trip_id') required this.tripId,
    required this.rating,
  });

  final String id;
  final String createdAt;
  final String comment;
  final String from;
  final String to;
  final String tripId;
  final double rating;
}
