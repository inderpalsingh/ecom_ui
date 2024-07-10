part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}
final class ProductsLoadingState extends ProductsState {}
final class ProductsSuccessState extends ProductsState {
  ProductModel productModel;
  ProductsSuccessState({required this.productModel});
}
final class ProductsFailedState extends ProductsState {

  String errorMgs;
  ProductsFailedState({required this.errorMgs});


}
