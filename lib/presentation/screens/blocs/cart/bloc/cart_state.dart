part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccessfullState extends CartState {}

final class CartFailedState extends CartState {
  String errorMsg;
  CartFailedState({required this.errorMsg});
}
