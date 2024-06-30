import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/models/login_model.dart';
import 'package:ecom_ui/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(LoginInitialState())  {

    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {

        var resJson = await userRepository.loginRepository(event.username, event.password);

      } catch (e) {

      }

    });
  }
}
