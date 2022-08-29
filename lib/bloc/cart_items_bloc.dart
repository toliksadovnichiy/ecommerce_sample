import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsBloc extends Bloc<CartItemsEvent, int> {
  CartItemsBloc() : super(0) {
    on<CartItemsIncrementEvent>(_onIncrement);
    on<CartItemsDecrementEvent>(_onDecrement);
  }

  _onIncrement(CartItemsIncrementEvent event, Emitter<int> emit) {
    emit(state+1);
  }
  _onDecrement(CartItemsDecrementEvent event, Emitter<int> emit) {
    emit(state-1);
  }
}

abstract class CartItemsEvent {}

class CartItemsIncrementEvent extends CartItemsEvent {}
class CartItemsDecrementEvent extends CartItemsEvent {}
