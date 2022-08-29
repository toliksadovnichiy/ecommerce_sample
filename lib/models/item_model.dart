import 'package:equatable/equatable.dart';

class Item extends Equatable{
  final int id;
  final String title;
  final int price;
  final String urlImage;
  final String description;

  const Item({
    required this.id,
    required this.title,
    required this.price,
    required this.urlImage,
    required this.description
  });

  @override
  List<Object> get props => [id, title, price, urlImage, description];
}

