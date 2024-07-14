import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/models/login_model.dart';
import 'package:ecom_ui/data/repository/user_repository.dart';
import 'package:ecom_ui/utils/api_exceptions.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(UserInitialState()) {
    on<UserLoginEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        var resJson = await userRepository.userLoginRepository(username: event.username, password: event.password);
        if (resJson != null) {
          if (resJson['message'] == "Invalid credentials") {
            emit(UserFailedState(errorMsg: "Invalid credentials"));
          }
          var varJson = UserModel.fromJSON(resJson);
          emit(UserSuccessState(userModel: varJson));
        }
      } catch (e) {
        emit(UserFailedState(errorMsg: e.toString()));
      }
    });
  }
}
