part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {}

class ItemGetItemsEvent extends ItemEvent {
  final int count;

  ItemGetItemsEvent(this.count);
}
