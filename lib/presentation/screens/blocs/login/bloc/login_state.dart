part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState({required this.loginModel});

}
final class LoginFailedState extends LoginState {
  String errorMsg;
  LoginFailedState({required this.errorMsg});
}
