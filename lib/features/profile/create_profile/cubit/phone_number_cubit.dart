import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_field/phone_number.dart';

@injectable
class PhoneCubit extends Cubit<PhoneNumber> {
  PhoneCubit() : super(PhoneNumber(countryISOCode: '', countryCode: '', number: ''));

  void update(PhoneNumber phoneNumber) => emit(phoneNumber);

  /// divide phone number to country code and number

  void setPhoneNumber(String phoneNumber, String countryCode) =>
      emit(PhoneNumber(countryISOCode: '', countryCode: countryCode, number: phoneNumber));

  String getFullNumber() {
    final phoneNumber = state;
    return '${phoneNumber.countryCode}${phoneNumber.number}';
  }
}
