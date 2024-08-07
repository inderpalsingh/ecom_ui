
class BaseUrlService{

  /*static const String BASE_URL = 'https://dummyjson.com';
  static const String LOGIN_URL = '$BASE_URL/auth/login';
  static const String USER_ME = '$BASE_URL/auth/me';
  static const String PRODUCTS = '$BASE_URL/products';
  static const String CATEGORIES = '$BASE_URL/products/categories';*/

  /// BaseUrl
  static const String BASE_URL = 'https://www.marketcraft.in/ecommerce-api';

  /// Users
  static const String LOGIN_URL = '$BASE_URL/user/login';
  static const String REGISTRATION = '$BASE_URL/user/registration';

  /// Products
  static const String PRODUCTS = '$BASE_URL/products';
  static const String CATEGORIES = '$BASE_URL/categories';

  /// Cart
  static const String ADD_TO_CART = '$BASE_URL/add-to-card';
  static const String VIEW_TO_CART = '$BASE_URL/product/view-cart';


  /// Order
  static const String PLACE_ORDER = '$BASE_URL/product/create-order';
  static const String GET_ORDER = '$BASE_URL/product/get-order';

}
