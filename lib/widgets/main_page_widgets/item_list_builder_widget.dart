import 'package:ecommerce_sample/bloc/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_items_bloc.dart';
import '../../bloc/item_bloc/item_bloc.dart';
import '../../views/product_page.dart';

class ItemListBuilderWidget extends StatelessWidget {
  const ItemListBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8,2,8,8),
      child: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          return Column(
            children: [
              if(state is ItemLoadingState)
                const CircularProgressIndicator(),
              if(state is ItemLoadedState)
                GridView.builder(
                    itemCount: state.items.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.75
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/product',
                              arguments: state.items[index]
                            );
                          },
                          splashColor: Colors.blue.withAlpha(30),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  state.items[index].urlImage,
                                  fit: BoxFit.fitWidth
                                ),
                                Text(
                                  state.items[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "Raleway",
                                    color: Colors.black54
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("\$${state.items[index].price}",
                                      style: TextStyle(
                                        color: Color(0xff002B5B),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Color(0xff256D85),
                                        backgroundColor: Color(0xFF8FE3CF)
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<CartCubit>(context).addCartItem(state.items[index]);
                                      },
                                      child: Text("Add")
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
            ],
          );
        },
      ),
    );
  }
}