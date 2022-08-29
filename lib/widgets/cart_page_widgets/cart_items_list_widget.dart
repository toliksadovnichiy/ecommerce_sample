import 'package:ecommerce_sample/bloc/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsListWidget extends StatelessWidget {
  const CartItemsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int? sum = 0;
    return Container(
      padding: const EdgeInsets.fromLTRB(8,2,8,8),
      child: Column(
        children: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Column(
                children: [
                  if(state is CartItemsLoadingState)
                    const CircularProgressIndicator(),
                  if(state is CartItemsState)
                    state.cartItems.length == 0 ? Center(
                      child: Text(
                        "CART IS EMPTY",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        //sum += state.cartItems[index].counter * state.cartItems[index].item.price ?? 0;
                        return Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.0),
                                child: Image.network(
                                  state.cartItems[index].item.urlImage,
                                  fit: BoxFit.fitWidth,
                                  height: 80,
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 1.0),
                                  child: Text(
                                    state.cartItems[index].item.title,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              Text(
                                "\$${state.cartItems[index].item.price} x ${state.cartItems[index].counter}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartCubit>(context).deleteCartItem(index);
                                  //sum = (sum - state.cartItems[index].counter * state.cartItems[index].item.price) ?? 0;
                                },
                                icon: Icon(
                                    Icons.delete_outline_rounded,
                                    size: 20,
                                    color: Colors.redAccent
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  //Text('Sum: ${sum}', style: TextStyle(fontSize: 28), textAlign: TextAlign.center,)
                ],
              );
            }
          )
        ],
      ),
    );
  }
}
