import 'package:bloc/bloc.dart';
import 'package:ecom_ui/data/models/categories_model.dart';
import 'package:ecom_ui/data/repository/categories_repository.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesRepository categoriesRepository;

  CategoriesBloc({required this.categoriesRepository}) : super(CategoriesInitialState()) {
    on<CategoriesAllEvent>((event, emit) async {
      emit(CategoriesLoadingState());

      try {
        var resposeJson = await categoriesRepository.getAllCategoriesRepository();
        if(resposeJson!=null){
          var respData = CategoriesModel.fromJSON(resposeJson);
          print('CategoriesBloc ===>> $respData');
          emit(CategoriesSuccessState(categoriesModel: respData));
        }

      } catch (e) {
        emit(CategoriesFailedState(errorMsg: e.toString()));
      }
    });
  }
}
