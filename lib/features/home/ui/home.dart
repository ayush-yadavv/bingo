import 'package:bingo/features/cart/ui/cart.dart';
import 'package:bingo/features/home/bloc/home_bloc.dart';
import 'package:bingo/features/home/ui/product_tile.dart';
import 'package:bingo/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const wishlist(),
              ));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const cart(),
              ));
        } else if (state is HomeProductWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item added to wishlist"),
          ));
        } else if (state is HomeProductCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item added to cart"),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                // backgroundColor: Colors.teal,
                title: const Text('Bingo'),
                actions: [
                  IconButton(
                      padding: const EdgeInsets.only(right: 10),
                      iconSize: 28,
                      onPressed: () {
                        homeBloc
                            .add(HomeProductWishlistButtonNavigatePressed());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      iconSize: 28,
                      padding: const EdgeInsets.only(right: 10),
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonNavigatePressed());
                      },
                      icon: const Icon(Icons.shopping_cart))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      homeBloc: homeBloc,
                      productDataModel: successState.products[index],
                    );
                  }),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const Scaffold(
              body: Center(
                child: SizedBox(),
              ),
            );
        }
      },
    );
  }
}
