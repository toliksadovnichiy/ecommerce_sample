import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/item_bloc/item_bloc.dart';

class LoadItemsButtonWidget extends StatelessWidget {
  const LoadItemsButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton.icon(
        onPressed: () {
          context.read<ItemBloc>().add(ItemGetItemsEvent(7));
        },
        icon: Icon(
          Icons.production_quantity_limits,
          size: 24.0,
        ),
        label: Text('Load Items'),
      ),
    );
  }
}