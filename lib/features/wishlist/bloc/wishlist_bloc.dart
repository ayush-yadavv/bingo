import 'dart:async';

import 'package:bingo/data/wishlist.dart';
import 'package:bingo/features/home/models/home_product_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(wishlistRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveEvent(
      RemoveFromWishlistEvent event, Emitter<WishlistState> emit) async {
    wishlistItems.remove(event.clickedProduct);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
    // emit(CartSuccessState(cartItems: updatedCartItems));
  }
}
