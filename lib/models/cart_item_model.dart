import 'package:equatable/equatable.dart';

import 'item_model.dart';

class CartItem extends Equatable{
  final Item item;
  int counter;

  CartItem({
    required this.item,
    required this.counter
  });

  @override
  List<Object> get props => [item, counter];
}