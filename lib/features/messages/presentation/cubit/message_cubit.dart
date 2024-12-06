import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class MessageCubit extends Cubit<String> {
  MessageCubit() : super('');

  void setMessage(String message) {
    emit(message);
  }

  void clearMessage() {
    emit('');
  }
}
