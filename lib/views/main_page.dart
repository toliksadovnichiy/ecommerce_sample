import 'package:ecommerce_sample/widgets/main_page_widgets/appbar_widget.dart';
import 'package:ecommerce_sample/widgets/main_page_widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/main_page_widgets/item_list_builder_widget.dart';
import '../widgets/main_page_widgets/load_items_button_widget.dart';

class MainPageWidget extends StatelessWidget {

  final controller = TextEditingController();

  @override
  Widget build (BuildContext context) {
    return getMainPageWidget(context);
  }

  Widget getMainPageWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          Column(
            children: [
              SearchFieldWidget(),
              LoadItemsButtonWidget(),
              ItemListBuilderWidget(),
            ],
          ),
        ],
      ),
    );
  }
}





