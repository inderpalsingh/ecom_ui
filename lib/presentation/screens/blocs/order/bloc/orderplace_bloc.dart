import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/repository/order_repository.dart';
import 'package:meta/meta.dart';

part 'orderplace_event.dart';
part 'orderplace_state.dart';

class OrderplaceBloc extends Bloc<OrderplaceEvent, OrderplaceState> {
  OrderRepository orderRepository;

  OrderplaceBloc({required this.orderRepository}) : super(OrderplaceInitialState()) {
    on<MyOrderPlaceEvent>((event, emit)async {

      emit(OrderplaceLoadingState());
      try {
        var respData = await orderRepository.createOrderRepository();
        if(respData['status']){
          print('order ===>> ${respData['status']}');
          emit(OrderplaceSuccessFullyState());
        } else{
          emit(OrderplaceFailedState(errorMsg: respData['message']));
        }
      } catch (e) {
        emit(OrderplaceFailedState(errorMsg: e.toString()));

      }

    });
  }
}
