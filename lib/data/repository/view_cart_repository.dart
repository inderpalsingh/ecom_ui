import 'package:ecom_ui/data/remote/base_url.dart';
import 'package:ecom_ui/data/remote/view_cart_api_service.dart';


class ViewCartRepository {
  ViewCartApiService viewCartApiService;
  ViewCartRepository({required this.viewCartApiService});

  Future<dynamic> getViewCartRepository() async {
    try {
      return await viewCartApiService.getViewCart(baseUrl: BaseUrlService.VIEW_TO_CART);
    } catch (e) {
      rethrow;
    }
  }
}
