import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/repository/signup_repository.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  RegisterRepository registerRepository;
  SignupBloc({required this.registerRepository}) : super(SignupInitialState()) {
    on<SignupInitialEvent>((event, emit) async {
      emit(SignupLoadingState());

      try {
        var responseData = await registerRepository.registerRepository(name: event.name, mobile_number: event.mobile_number.toString(), email: event.email, password: event.password);
        // print('responseData ==> $responseData');
        dynamic jsonData = jsonEncode(responseData['status']);
        // print('jsonData ==> $jsonData');
        if(jsonData){
          emit(SignupSuccessfulState());
        } else{
          emit(SignupFailedState(errorMsg: 'Register failed'));
        }


      } catch (e) {
        emit(SignupFailedState(errorMsg: e.toString()));
      }
    });
  }
}
