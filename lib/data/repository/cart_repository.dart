import 'package:ecom_ui/data/remote/base_url.dart';
import 'package:ecom_ui/data/remote/cart_api_service.dart';

class CartRepository {
  CartApiService cartApiService;

  CartRepository({required this.cartApiService});

  Future<dynamic> addToCartRepository({required int quantity,required int productId}) async {
    try {
      return await cartApiService.addToCartApiService(baseUrl: BaseUrlService.ADD_TO_CART, prodductId: productId, quantity: quantity);
    } catch (e) {
      rethrow;
    }
  }
}
