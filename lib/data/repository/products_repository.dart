import 'package:ecom_ui/data/remote/base_url.dart';
import 'package:ecom_ui/data/remote/product_api_service.dart';

class ProductsRepository{

  ProductApiService productApiService;

  ProductsRepository({required this.productApiService});


  Future<dynamic> getAllProductsRepository()async{

    try {
      return await productApiService.getAllProductApiService(baseUrl: BaseUrlService.PRODUCTS);
    } catch (e) {
      rethrow;
    }
  }
}