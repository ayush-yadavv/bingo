part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveEvent extends CartEvent {
  final ProductDataModel clickedproduct;

  CartRemoveEvent({
    required this.clickedproduct,
  });
}
