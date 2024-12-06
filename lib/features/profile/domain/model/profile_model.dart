import 'package:dart_mappable/dart_mappable.dart';

part 'profile_model.mapper.dart';

@MappableClass(ignoreNull: true)
final class ProfileModel with ProfileModelMappable {
  final String? id;
  final String? name;
  final String? surname;
  final String? email;
  final String? phoneNumber;
  final String? school;
  final String? birthday;
  final String? department;
  final String? profilePhoto;

  @MappableField(key: 'student_document')
  final String? studentDocument;

  final String? phoneCountryCode;
  final String? gender;
  final String? carPlate;
  final int? age;
  final double? rating;
  final ProfileStatus? status;

  @MappableField(key: 'fcm_token')
  final String? fcmToken;

  @MappableField(key: 'is_verified')
  final bool? isVerified;

  ProfileModel({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.school,
    this.birthday,
    this.department,
    this.profilePhoto,
    this.studentDocument,
    this.phoneCountryCode,
    this.gender,
    this.carPlate,
    this.age,
    this.rating,
    this.fcmToken,
    this.isVerified,
    this.status,
  });
}

@MappableEnum()
enum ProfileStatus {
  active,
  disabled,
}
