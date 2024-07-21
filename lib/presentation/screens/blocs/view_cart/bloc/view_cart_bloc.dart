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
        if (responseData['status']) {
          List<ViewCartModel> getCart = [];

          for (Map<String, dynamic> eachCart in responseData['data']) {
            var data = ViewCartModel.fromJSON(eachCart);
            getCart.add(data);
          }


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
