import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

part 'validator_event.dart';
part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(ValidatorState()) {
    on<ValidateEvent>((validate));
  }

  validate(ValidateEvent event, emit) {
    emit(state.copyWith(
      email: event.email,
      password: event.password,
    ));
    emit(state.copyWith(
      passwordValidationStatus: state.password.isNull
          ? null
          : state.password!.length > 7
              ? ValidationStatus.valid
              : ValidationStatus.notValid,
      emailValidationStatus: state.email.isNull
          ? null
          : EmailValidator.validate(state.email!) &&
                  state.email
                          .split("@")
                          .first[state.email.split("@").first.length - 1] ==
                      "t"
              ? ValidationStatus.valid
              : ValidationStatus.notValid,
    ));
  }
}
