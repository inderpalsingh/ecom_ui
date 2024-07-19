part of 'view_cart_bloc.dart';

@immutable
sealed class ViewCartState {}

final class ViewCartInitialState extends ViewCartState {}
final class ViewCartLoadingState extends ViewCartState {}
final class ViewCartSuccessfullyState extends ViewCartState {
  List<ViewCartModel> viewCartModel = [];
  ViewCartSuccessfullyState({required this.viewCartModel});
}
final class ViewCartFailedState extends ViewCartState {
  String errorMsg;
  ViewCartFailedState({required this.errorMsg});
}
