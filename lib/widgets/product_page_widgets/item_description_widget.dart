import 'package:flutter/material.dart';

import '../../models/item_model.dart';

class ItemDescriptionWidget extends StatelessWidget {
  const ItemDescriptionWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF002B5B),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70,0,0,0),
                child: Text(
                  "PRODUCT DETAIL",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF000000)
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          item.urlImage,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 19,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "\$${item.price}",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            Text(
                              "\$${(item.price * 1.175).toStringAsFixed(0)}",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Description: ${item.description}",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}