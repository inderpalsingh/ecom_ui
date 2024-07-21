
import 'package:ecom_ui/data/remote/base_url.dart';
import 'package:ecom_ui/data/remote/order_api_service.dart';

class OrderRepository{
  OrderApiService orderApiService;
  OrderRepository({required this.orderApiService});
  Future<dynamic> createOrderRepository()async{

    try {
      return await orderApiService.createOrder(baseUrl: BaseUrlService.PLACE_ORDER);
    } catch (e) {
      rethrow;
    }
  }
}