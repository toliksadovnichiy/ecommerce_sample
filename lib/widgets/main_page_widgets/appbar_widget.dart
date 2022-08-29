import 'package:ecommerce_sample/bloc/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_sample/bloc/cart_items_bloc.dart';
import 'package:ecommerce_sample/views/cart_page.dart';
import 'package:ecommerce_sample/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return getAppBarWidget(context);
  }

  Widget getAppBarWidget(BuildContext context) {
    return AppBar(
      leading: Container(
        child: IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
      ),
      title: Text(
        //"eCommerce-Sample",
        ModalRoute.of(context)!.settings.name.toString(),
        style: TextStyle(fontFamily: 'Raleway'),
      ),
      actions: <Widget> [
        IconButton(
          icon: Icon(Icons.search_rounded),
          onPressed:() {},
        ),
        Stack(
          children: [
            ModalRoute.of(context)!.settings.name.toString() == "/cart" ?
              IconButton(
                icon: Icon(Icons.format_list_bulleted_rounded),
                onPressed:() {
                  Navigator.pop(context);
                },
              ) :
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(0),
                    child: BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) =>
                          Column(
                            children: [
                              if(state is CartItemsLoadingState)
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              if(state is CartItemsState)
                                Text(
                                  state.cartItems.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                            ],
                          ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color(0xFF8FE3CF)
                    ),
                  ),
                ],
              )
          ]
        ),
      ],
      backgroundColor: Color(0xff002B5B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}