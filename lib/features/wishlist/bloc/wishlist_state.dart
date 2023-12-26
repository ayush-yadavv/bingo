part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistItemRemovedState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistItemRemovedState({
    required this.wishlistItems,
  });
}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessState({
    required this.wishlistItems,
  });
}
