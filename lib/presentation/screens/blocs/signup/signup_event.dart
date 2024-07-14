part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}
class SignupInitialEvent extends  SignupEvent {
  String name;
  String mobile_number;
  String email;
  String password;

  SignupInitialEvent({required this.name, required this.email, required this.mobile_number, required this.password});
}
