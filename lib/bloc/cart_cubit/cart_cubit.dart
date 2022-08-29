import 'package:bloc/bloc.dart';
import 'package:ecommerce_sample/models/cart_item_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../models/item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartItemsState(cartItems: []));

  void addCartItem(Item newItem) {
    List<CartItem> cart = (state as CartItemsState).cartItems;
    bool itemNotFound = true;
    if(cart.isNotEmpty){
      for (var carItem in cart) {
        if(carItem.item.id == newItem.id) {
          carItem.counter++;
          itemNotFound = false;
          break;
        }
      }
    }
    if(itemNotFound)
      cart.add(CartItem(item: newItem, counter: 1));

    emit(CartItemsState(cartItems: cart));
  }

  void deleteCartItem(int index) {
    List<CartItem> cart = (state as CartItemsState).cartItems;
    if(cart.isNotEmpty){
      cart.removeAt(index);
    }
    emit(CartItemsState(cartItems: cart));
  }
}