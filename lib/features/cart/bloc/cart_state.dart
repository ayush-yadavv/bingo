part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartItemRemovedState extends CartState {
  final List<ProductDataModel> cartItems;

  CartItemRemovedState({
    required this.cartItems,
  });
}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({
    required this.cartItems,
  });
}
