import 'package:ecommerce_sample/bloc/cart_items_bloc.dart';
import 'package:ecommerce_sample/models/item_model.dart';
import 'package:ecommerce_sample/widgets/main_page_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_page_widgets/add_to_cart_button_widget.dart';
import '../widgets/product_page_widgets/item_description_widget.dart';

class ProductPage extends StatelessWidget {

  //final Item item;
  const ProductPage({super.key});

  @override
  Widget build (BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            ItemDescriptionWidget(item: item),
            AddToCartButtonWidget(item: item)
          ],
        ),
      ),
    );
  }
}



