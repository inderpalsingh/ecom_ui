part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitialState extends CategoriesState {}
final class CategoriesLoadingState extends CategoriesState {}
final class CategoriesSuccessState extends CategoriesState {
  CategoriesModel categoriesModel;
  CategoriesSuccessState({required this.categoriesModel});
}
final class CategoriesFailedState extends CategoriesState {
  String errorMsg;
  CategoriesFailedState({required this.errorMsg});
}
