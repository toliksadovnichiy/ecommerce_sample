part of 'item_bloc.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoadedState extends ItemState {
  final List<Item> items;

  ItemLoadedState({required this.items});
}

class ItemLoadingState extends ItemState {}
