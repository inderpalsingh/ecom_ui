import 'package:ecom_ui/data/remote/base_url.dart';
import 'package:ecom_ui/data/remote/signup_api_service.dart';

class RegisterRepository {
  RegisterApiService signupApiService;

  RegisterRepository({required this.signupApiService});

  Future<dynamic> registerRepository({required String name, required String mobile_number, required String email, required String password}) async {
    try {
      return await signupApiService.signupService(baseUrl: BaseUrlService.REGISTRATION, name: name, mobile_number: mobile_number, email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
