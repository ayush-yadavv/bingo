part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

abstract class HomeActionEvent extends HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonPressed extends HomeEvent {
  final ProductDataModel clickedproduct;

  HomeProductWishlistButtonPressed({
    required this.clickedproduct,
  });
}

class HomeProductCartButtonPressed extends HomeEvent {
  final ProductDataModel clickedproduct;

  HomeProductCartButtonPressed({
    required this.clickedproduct,
  });
}

class HomeProductWishlistButtonNavigatePressed extends HomeEvent {}

class HomeProductCartButtonNavigatePressed extends HomeEvent {}
