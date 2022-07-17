part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class RequestHomeData extends HomeEvent {
  final String productId;

  RequestHomeData(this.productId);

  @override
  List<Object> get props => [productId];
}
