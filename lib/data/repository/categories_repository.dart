import 'package:ecom_ui/data/remote/base_url.dart';
import 'package:ecom_ui/data/remote/categories_api_service.dart';

class CategoriesRepository{

  CategoriesApiService categoriesApiService;
  CategoriesRepository({required this.categoriesApiService});

  Future<dynamic> getAllCategoriesRepository()async {

    try {
      return await categoriesApiService.getAllCategoriesApiService(baseUrl: BaseUrlService.CATEGORIES);
    } catch (e) {
      rethrow;
    }
  }


}