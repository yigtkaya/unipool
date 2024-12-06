// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment_model.dart';

class CommentModelMapper extends ClassMapperBase<CommentModel> {
  CommentModelMapper._();

  static CommentModelMapper? _instance;
  static CommentModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommentModel';

  static String _$id(CommentModel v) => v.id;
  static const Field<CommentModel, String> _f$id = Field('id', _$id);
  static String _$createdAt(CommentModel v) => v.createdAt;
  static const Field<CommentModel, String> _f$createdAt = Field('createdAt', _$createdAt, key: 'created_at');
  static String _$comment(CommentModel v) => v.comment;
  static const Field<CommentModel, String> _f$comment = Field('comment', _$comment);
  static String _$from(CommentModel v) => v.from;
  static const Field<CommentModel, String> _f$from = Field('from', _$from);
  static String _$to(CommentModel v) => v.to;
  static const Field<CommentModel, String> _f$to = Field('to', _$to);
  static String _$tripId(CommentModel v) => v.tripId;
  static const Field<CommentModel, String> _f$tripId = Field('tripId', _$tripId, key: 'trip_id');
  static double _$rating(CommentModel v) => v.rating;
  static const Field<CommentModel, double> _f$rating = Field('rating', _$rating);

  @override
  final MappableFields<CommentModel> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #comment: _f$comment,
    #from: _f$from,
    #to: _f$to,
    #tripId: _f$tripId,
    #rating: _f$rating,
  };

  static CommentModel _instantiate(DecodingData data) {
    return CommentModel(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        comment: data.dec(_f$comment),
        from: data.dec(_f$from),
        to: data.dec(_f$to),
        tripId: data.dec(_f$tripId),
        rating: data.dec(_f$rating));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentModel>(map);
  }

  static CommentModel fromJson(String json) {
    return ensureInitialized().decodeJson<CommentModel>(json);
  }
}

mixin CommentModelMappable {
  String toJson() {
    return CommentModelMapper.ensureInitialized().encodeJson<CommentModel>(this as CommentModel);
  }

  Map<String, dynamic> toMap() {
    return CommentModelMapper.ensureInitialized().encodeMap<CommentModel>(this as CommentModel);
  }

  CommentModelCopyWith<CommentModel, CommentModel, CommentModel> get copyWith =>
      _CommentModelCopyWithImpl(this as CommentModel, $identity, $identity);
  @override
  String toString() {
    return CommentModelMapper.ensureInitialized().stringifyValue(this as CommentModel);
  }

  @override
  bool operator ==(Object other) {
    return CommentModelMapper.ensureInitialized().equalsValue(this as CommentModel, other);
  }

  @override
  int get hashCode {
    return CommentModelMapper.ensureInitialized().hashValue(this as CommentModel);
  }
}

extension CommentModelValueCopy<$R, $Out> on ObjectCopyWith<$R, CommentModel, $Out> {
  CommentModelCopyWith<$R, CommentModel, $Out> get $asCommentModel =>
      $base.as((v, t, t2) => _CommentModelCopyWithImpl(v, t, t2));
}

abstract class CommentModelCopyWith<$R, $In extends CommentModel, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? createdAt, String? comment, String? from, String? to, String? tripId, double? rating});
  CommentModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, CommentModel, $Out>
    implements CommentModelCopyWith<$R, CommentModel, $Out> {
  _CommentModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentModel> $mapper = CommentModelMapper.ensureInitialized();
  @override
  $R call({String? id, String? createdAt, String? comment, String? from, String? to, String? tripId, double? rating}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (createdAt != null) #createdAt: createdAt,
        if (comment != null) #comment: comment,
        if (from != null) #from: from,
        if (to != null) #to: to,
        if (tripId != null) #tripId: tripId,
        if (rating != null) #rating: rating
      }));
  @override
  CommentModel $make(CopyWithData data) => CommentModel(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      comment: data.get(#comment, or: $value.comment),
      from: data.get(#from, or: $value.from),
      to: data.get(#to, or: $value.to),
      tripId: data.get(#tripId, or: $value.tripId),
      rating: data.get(#rating, or: $value.rating));

  @override
  CommentModelCopyWith<$R2, CommentModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommentModelCopyWithImpl($value, $cast, t);
}
