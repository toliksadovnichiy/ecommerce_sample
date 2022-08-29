import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/item_model.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<ItemGetItemsEvent>(_onGetItem);
  }

  _onGetItem(ItemGetItemsEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoadingState());
    await Future.delayed(Duration(seconds: 1));

    final items = List.generate(event.count, (index) => Item(
      id: index,
      title: "$index item with very long name",
      price: (index+1)*100,
      urlImage: "https://images.prom.ua/1070734019_w640_h640_1070734019.jpg",
      description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. "
    ));

    emit(ItemLoadedState(items: items));
  }
}
