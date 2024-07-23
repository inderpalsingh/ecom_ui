import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/models/view_cart_model.dart';
import 'package:ecom_ui/data/repository/view_cart_repository.dart';
import 'package:meta/meta.dart';

part 'view_cart_event.dart';
part 'view_cart_state.dart';

class ViewCartBloc extends Bloc<ViewCartEvent, ViewCartState> {
  ViewCartRepository viewCartRepository;
  ViewCartBloc({required this.viewCartRepository}) : super(ViewCartInitialState()) {
    on<GetViewCartEvent>((event, emit) async {
      emit(ViewCartLoadingState());

      try {
        var responseData = await viewCartRepository.getViewCartRepository();
        List<ViewCartModel> getCart = [];
        if (responseData != null ) {

          for (Map<String, dynamic> eachCart in responseData['data']) {
            var data = ViewCartModel.fromJSON(eachCart);
            getCart.add(data);
          }
          // print('cart ==>> ${responseData['status']}');
          // print('cart data ==>>  ${responseData['data']}');
          // print('getCart ==>> ${getCart.toString()}');
          emit(ViewCartSuccessfullyState(viewCartModel: getCart));
        }else{
          emit(ViewCartFailedState(errorMsg: responseData['message']));

        }
      } catch (e) {
        rethrow;
      }
    });
  }
}
