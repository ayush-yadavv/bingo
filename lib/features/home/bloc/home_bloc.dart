import 'dart:async';

import 'package:bingo/data/cart.dart';
import 'package:bingo/data/data.dart';
import 'package:bingo/data/wishlist.dart';
import 'package:bingo/features/home/models/home_product_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonNavigatePressed>(
        homeProductWishlistButtonNavigatePressedEvent);
    on<HomeProductCartButtonNavigatePressed>(
        homeProductCartButtonNavigatePressedEvent);
    on<HomeProductWishlistButtonPressed>(homeProductWishlistButtonPressedEvent);
    on<HomeProductCartButtonPressed>(homeProductCartButtonPressedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadingSuccessState(
        products: groceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                price: e['price'],
                description: e['description'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonNavigatePressedEvent(
      HomeProductWishlistButtonNavigatePressed event, Emitter<HomeState> emit) {
    print("wishlist pressed");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigatePressedEvent(
      HomeProductCartButtonNavigatePressed event, Emitter<HomeState> emit) {
    print("cart pressed");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonPressedEvent(
      HomeProductWishlistButtonPressed event, Emitter<HomeState> emit) {
    print("wishlist Item added");
    wishlistItems.add(event.clickedproduct);
    emit(HomeProductWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonPressedEvent(
      HomeProductCartButtonPressed event, Emitter<HomeState> emit) {
    print("cart Item added");
    cartItems.add(event.clickedproduct);
    emit(HomeProductCartedActionState());
  }
}
