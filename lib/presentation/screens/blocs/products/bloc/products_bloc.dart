import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/models/products_model.dart';
import 'package:ecom_ui/data/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsRepository productsRepository;


  ProductsBloc({required this.productsRepository}) : super(ProductsInitialState())  {
    on<ProductsInitialEvent>((event, emit) async {

      emit(ProductsLoadingState());

      try {
        var responseData = await productsRepository.getAllProductsRepository();
        print('prodData ==> $responseData');
        if(responseData !=null){
          var prodData = ProductModel.fromJson(responseData);

          emit(ProductsSuccessState(productModel: prodData));
        }
      } catch (e) {
        emit(ProductsFailedState(errorMgs: e.toString()));
      }
    });
  }
}
