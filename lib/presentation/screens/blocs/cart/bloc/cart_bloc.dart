import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/repository/cart_repository.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepository cartRepository;
  CartBloc({required this.cartRepository}) : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) async {
      emit(CartLoadingState());

      try {
        var responseData = await cartRepository.addToCartRepository(productId: event.productId, quantity: event.qty);
        if (responseData != null) {
          emit(CartSuccessfullState());
        } else {
          emit(CartFailedState(errorMsg: responseData['message']));
        }
      } catch (e) {
        emit(CartFailedState(errorMsg: e.toString()));
      }
    });
  }
}
