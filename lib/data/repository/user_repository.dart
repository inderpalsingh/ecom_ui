
import 'package:ecom_ui/data/remote/base_url.dart';
import 'package:ecom_ui/data/remote/user_api_service.dart';

class UserRepository{

  RemoteApiService remoteApiService;

  UserRepository({required this.remoteApiService});

  Future<dynamic> userLoginRepository({required String username,required String password})async{

    try{
      return await remoteApiService.userLogin(baseUrl: BaseUrlService.LOGIN_URL, username: username, password: password);
    } catch (e){
      rethrow;
    }
  }


  Future<dynamic> getUserRepository()async{
    try {
      return await remoteApiService.getUserLoggin(baseUrl: BaseUrlService.USER_ME);
    } catch (e) {
      rethrow;
    }
  }
}