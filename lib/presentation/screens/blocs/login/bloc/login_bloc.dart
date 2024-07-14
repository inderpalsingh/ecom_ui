import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(UserInitialState()) {
    on<UserLoginEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        var resJson = await userRepository.userLoginRepository(email: event.email, password: event.password);
        if (resJson != null) {
          if (resJson['message'] == "Invalid credentials") {
            emit(UserFailedState(errorMsg: "Invalid credentials"));
          }
          emit(UserSuccessState());
        }
      } catch (e) {
        emit(UserFailedState(errorMsg: e.toString()));
      }
    });
  }
}
