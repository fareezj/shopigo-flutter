part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeFetchingData extends HomeState {}

class HomeFetchDataSuccess extends HomeState {
  InventoryResModel inventoryList;

  HomeFetchDataSuccess(this.inventoryList);

  @override
  List<Object> get props => [inventoryList];
}
