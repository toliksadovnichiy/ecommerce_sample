part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartItemsLoadingState extends CartState {
}

class CartItemsState extends CartState {
  final List<CartItem> cartItems;

  CartItemsState({required this.cartItems});
}
