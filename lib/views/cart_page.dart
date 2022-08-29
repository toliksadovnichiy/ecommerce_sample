import 'package:ecommerce_sample/widgets/main_page_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_page_widgets/cart_header_widget.dart';
import '../widgets/cart_page_widgets/cart_items_list_widget.dart';

class CartPageWidget extends StatelessWidget {
  const CartPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartHeaderWidget(),
            CartItemsListWidget()
          ],
        ),
      ),
    );
  }
}


