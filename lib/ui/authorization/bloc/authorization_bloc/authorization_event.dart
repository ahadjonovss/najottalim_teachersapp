part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationEvent {}

class SignInEvent extends AuthorizationEvent {
  UserModel user;
  SignInEvent(this.user);
}
