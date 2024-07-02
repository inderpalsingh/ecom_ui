part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class UserInitialState extends LoginState {}
final class UserLoadingState extends LoginState {}
final class UserSuccessState extends LoginState {
  UserModel userModel;
  UserSuccessState({required this.userModel});

}
final class UserFailedState extends LoginState {
  String errorMsg;
  UserFailedState({required this.errorMsg});
}
