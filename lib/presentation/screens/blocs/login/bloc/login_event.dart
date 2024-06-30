part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class UserLoginEvent extends LoginEvent{
  final String username;
  final String password;
  UserLoginEvent({required this.username, required this.password});
}