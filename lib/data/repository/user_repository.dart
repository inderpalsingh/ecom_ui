
import 'package:ecom_ui/services/base_url.dart';
import 'package:ecom_ui/services/remote_api_service.dart';

class UserRepository{

  RemoteApiService remoteApiService;

  UserRepository({required this.remoteApiService});

  Future<dynamic> loginRepository({required String username,required String password})async{

    try{
      return await remoteApiService.userLogin(baseUrl: BaseUrlService.LOGIN_URL);
    } catch (e){
      rethrow;
    }
  }

}