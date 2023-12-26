// WishlistTileWidget.dart
import 'package:bingo/features/home/models/home_product_data_model.dart';
import 'package:bingo/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final WishlistBloc wishlistBloc;
  final ProductDataModel productDataModel;
  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(productDataModel.imageUrl)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(productDataModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(productDataModel.description),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$ ${productDataModel.price}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      wishlistBloc.add(RemoveFromWishlistEvent(
                          clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.delete_outline_rounded)),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
