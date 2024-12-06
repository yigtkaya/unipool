// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile_model.dart';

class ProfileStatusMapper extends EnumMapper<ProfileStatus> {
  ProfileStatusMapper._();

  static ProfileStatusMapper? _instance;
  static ProfileStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileStatusMapper._());
    }
    return _instance!;
  }

  static ProfileStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProfileStatus decode(dynamic value) {
    switch (value) {
      case 'active':
        return ProfileStatus.active;
      case 'disabled':
        return ProfileStatus.disabled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ProfileStatus self) {
    switch (self) {
      case ProfileStatus.active:
        return 'active';
      case ProfileStatus.disabled:
        return 'disabled';
    }
  }
}

extension ProfileStatusMapperExtension on ProfileStatus {
  String toValue() {
    ProfileStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ProfileStatus>(this) as String;
  }
}

class ProfileModelMapper extends ClassMapperBase<ProfileModel> {
  ProfileModelMapper._();

  static ProfileModelMapper? _instance;
  static ProfileModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileModelMapper._());
      ProfileStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProfileModel';

  static String? _$id(ProfileModel v) => v.id;
  static const Field<ProfileModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$name(ProfileModel v) => v.name;
  static const Field<ProfileModel, String> _f$name = Field('name', _$name, opt: true);
  static String? _$surname(ProfileModel v) => v.surname;
  static const Field<ProfileModel, String> _f$surname = Field('surname', _$surname, opt: true);
  static String? _$email(ProfileModel v) => v.email;
  static const Field<ProfileModel, String> _f$email = Field('email', _$email, opt: true);
  static String? _$phoneNumber(ProfileModel v) => v.phoneNumber;
  static const Field<ProfileModel, String> _f$phoneNumber = Field('phoneNumber', _$phoneNumber, opt: true);
  static String? _$school(ProfileModel v) => v.school;
  static const Field<ProfileModel, String> _f$school = Field('school', _$school, opt: true);
  static String? _$birthday(ProfileModel v) => v.birthday;
  static const Field<ProfileModel, String> _f$birthday = Field('birthday', _$birthday, opt: true);
  static String? _$department(ProfileModel v) => v.department;
  static const Field<ProfileModel, String> _f$department = Field('department', _$department, opt: true);
  static String? _$profilePhoto(ProfileModel v) => v.profilePhoto;
  static const Field<ProfileModel, String> _f$profilePhoto = Field('profilePhoto', _$profilePhoto, opt: true);
  static String? _$studentDocument(ProfileModel v) => v.studentDocument;
  static const Field<ProfileModel, String> _f$studentDocument =
      Field('studentDocument', _$studentDocument, key: 'student_document', opt: true);
  static String? _$phoneCountryCode(ProfileModel v) => v.phoneCountryCode;
  static const Field<ProfileModel, String> _f$phoneCountryCode =
      Field('phoneCountryCode', _$phoneCountryCode, opt: true);
  static String? _$gender(ProfileModel v) => v.gender;
  static const Field<ProfileModel, String> _f$gender = Field('gender', _$gender, opt: true);
  static String? _$carPlate(ProfileModel v) => v.carPlate;
  static const Field<ProfileModel, String> _f$carPlate = Field('carPlate', _$carPlate, opt: true);
  static int? _$age(ProfileModel v) => v.age;
  static const Field<ProfileModel, int> _f$age = Field('age', _$age, opt: true);
  static double? _$rating(ProfileModel v) => v.rating;
  static const Field<ProfileModel, double> _f$rating = Field('rating', _$rating, opt: true);
  static String? _$fcmToken(ProfileModel v) => v.fcmToken;
  static const Field<ProfileModel, String> _f$fcmToken = Field('fcmToken', _$fcmToken, key: 'fcm_token', opt: true);
  static bool? _$isVerified(ProfileModel v) => v.isVerified;
  static const Field<ProfileModel, bool> _f$isVerified =
      Field('isVerified', _$isVerified, key: 'is_verified', opt: true);
  static ProfileStatus? _$status(ProfileModel v) => v.status;
  static const Field<ProfileModel, ProfileStatus> _f$status = Field('status', _$status, opt: true);

  @override
  final MappableFields<ProfileModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #surname: _f$surname,
    #email: _f$email,
    #phoneNumber: _f$phoneNumber,
    #school: _f$school,
    #birthday: _f$birthday,
    #department: _f$department,
    #profilePhoto: _f$profilePhoto,
    #studentDocument: _f$studentDocument,
    #phoneCountryCode: _f$phoneCountryCode,
    #gender: _f$gender,
    #carPlate: _f$carPlate,
    #age: _f$age,
    #rating: _f$rating,
    #fcmToken: _f$fcmToken,
    #isVerified: _f$isVerified,
    #status: _f$status,
  };
  @override
  final bool ignoreNull = true;

  static ProfileModel _instantiate(DecodingData data) {
    return ProfileModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        surname: data.dec(_f$surname),
        email: data.dec(_f$email),
        phoneNumber: data.dec(_f$phoneNumber),
        school: data.dec(_f$school),
        birthday: data.dec(_f$birthday),
        department: data.dec(_f$department),
        profilePhoto: data.dec(_f$profilePhoto),
        studentDocument: data.dec(_f$studentDocument),
        phoneCountryCode: data.dec(_f$phoneCountryCode),
        gender: data.dec(_f$gender),
        carPlate: data.dec(_f$carPlate),
        age: data.dec(_f$age),
        rating: data.dec(_f$rating),
        fcmToken: data.dec(_f$fcmToken),
        isVerified: data.dec(_f$isVerified),
        status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static ProfileModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProfileModel>(map);
  }

  static ProfileModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProfileModel>(json);
  }
}

mixin ProfileModelMappable {
  String toJson() {
    return ProfileModelMapper.ensureInitialized().encodeJson<ProfileModel>(this as ProfileModel);
  }

  Map<String, dynamic> toMap() {
    return ProfileModelMapper.ensureInitialized().encodeMap<ProfileModel>(this as ProfileModel);
  }

  ProfileModelCopyWith<ProfileModel, ProfileModel, ProfileModel> get copyWith =>
      _ProfileModelCopyWithImpl(this as ProfileModel, $identity, $identity);
  @override
  String toString() {
    return ProfileModelMapper.ensureInitialized().stringifyValue(this as ProfileModel);
  }

  @override
  bool operator ==(Object other) {
    return ProfileModelMapper.ensureInitialized().equalsValue(this as ProfileModel, other);
  }

  @override
  int get hashCode {
    return ProfileModelMapper.ensureInitialized().hashValue(this as ProfileModel);
  }
}

extension ProfileModelValueCopy<$R, $Out> on ObjectCopyWith<$R, ProfileModel, $Out> {
  ProfileModelCopyWith<$R, ProfileModel, $Out> get $asProfileModel =>
      $base.as((v, t, t2) => _ProfileModelCopyWithImpl(v, t, t2));
}

abstract class ProfileModelCopyWith<$R, $In extends ProfileModel, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? name,
      String? surname,
      String? email,
      String? phoneNumber,
      String? school,
      String? birthday,
      String? department,
      String? profilePhoto,
      String? studentDocument,
      String? phoneCountryCode,
      String? gender,
      String? carPlate,
      int? age,
      double? rating,
      String? fcmToken,
      bool? isVerified,
      ProfileStatus? status});
  ProfileModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProfileModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ProfileModel, $Out>
    implements ProfileModelCopyWith<$R, ProfileModel, $Out> {
  _ProfileModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfileModel> $mapper = ProfileModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? surname = $none,
          Object? email = $none,
          Object? phoneNumber = $none,
          Object? school = $none,
          Object? birthday = $none,
          Object? department = $none,
          Object? profilePhoto = $none,
          Object? studentDocument = $none,
          Object? phoneCountryCode = $none,
          Object? gender = $none,
          Object? carPlate = $none,
          Object? age = $none,
          Object? rating = $none,
          Object? fcmToken = $none,
          Object? isVerified = $none,
          Object? status = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (surname != $none) #surname: surname,
        if (email != $none) #email: email,
        if (phoneNumber != $none) #phoneNumber: phoneNumber,
        if (school != $none) #school: school,
        if (birthday != $none) #birthday: birthday,
        if (department != $none) #department: department,
        if (profilePhoto != $none) #profilePhoto: profilePhoto,
        if (studentDocument != $none) #studentDocument: studentDocument,
        if (phoneCountryCode != $none) #phoneCountryCode: phoneCountryCode,
        if (gender != $none) #gender: gender,
        if (carPlate != $none) #carPlate: carPlate,
        if (age != $none) #age: age,
        if (rating != $none) #rating: rating,
        if (fcmToken != $none) #fcmToken: fcmToken,
        if (isVerified != $none) #isVerified: isVerified,
        if (status != $none) #status: status
      }));
  @override
  ProfileModel $make(CopyWithData data) => ProfileModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      surname: data.get(#surname, or: $value.surname),
      email: data.get(#email, or: $value.email),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      school: data.get(#school, or: $value.school),
      birthday: data.get(#birthday, or: $value.birthday),
      department: data.get(#department, or: $value.department),
      profilePhoto: data.get(#profilePhoto, or: $value.profilePhoto),
      studentDocument: data.get(#studentDocument, or: $value.studentDocument),
      phoneCountryCode: data.get(#phoneCountryCode, or: $value.phoneCountryCode),
      gender: data.get(#gender, or: $value.gender),
      carPlate: data.get(#carPlate, or: $value.carPlate),
      age: data.get(#age, or: $value.age),
      rating: data.get(#rating, or: $value.rating),
      fcmToken: data.get(#fcmToken, or: $value.fcmToken),
      isVerified: data.get(#isVerified, or: $value.isVerified),
      status: data.get(#status, or: $value.status));

  @override
  ProfileModelCopyWith<$R2, ProfileModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProfileModelCopyWithImpl($value, $cast, t);
}
