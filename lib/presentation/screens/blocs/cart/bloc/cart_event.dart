// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCartEvent extends CartEvent {
  int productId;
  int qty;
  AddToCartEvent({required this.productId, required this.qty});
}
