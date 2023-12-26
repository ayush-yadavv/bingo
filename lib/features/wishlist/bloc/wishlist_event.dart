part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class RemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;

  RemoveFromWishlistEvent({
    required this.clickedProduct,
  });
}
