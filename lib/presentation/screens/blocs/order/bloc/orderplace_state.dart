part of 'orderplace_bloc.dart';

@immutable
sealed class OrderplaceState {}

final class OrderplaceInitialState extends OrderplaceState {}
final class OrderplaceLoadingState extends OrderplaceState {}
final class OrderplaceSuccessFullyState extends OrderplaceState {

}
final class OrderplaceFailedState extends OrderplaceState {
  String errorMsg;
  OrderplaceFailedState({required this.errorMsg});
}
