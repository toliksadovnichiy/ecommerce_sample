import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_cubit/cart_cubit.dart';
import '../../models/item_model.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final Item item;
  const AddToCartButtonWidget({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton.icon(
        onPressed: () {
          BlocProvider.of<CartCubit>(context).addCartItem(item);
        },
        icon: Icon(
          Icons.shopping_cart_rounded,
          size: 24.0,
        ),
        label: Text('Add to cart'),
      ),
    );
  }
}