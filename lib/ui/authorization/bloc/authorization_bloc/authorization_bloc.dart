import '../../../../utils/tools/file_importer.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc()
      : super(AuthorizationState(message: '', status: ResponseStatus.pure)) {
    on<SignInEvent>(signIn);
  }

  signIn(SignInEvent event, emit) async {
    MyResponse myResponse = MyResponse();
    emit(state.copyWith(status: ResponseStatus.inProgress));
    myResponse = await getIt<AuthorizationRepository>().signIn(event.user);
    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(
          status: ResponseStatus.inFail, message: myResponse.message));
    }
  }
}
