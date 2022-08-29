import 'package:flutter/material.dart';

class CartHeaderWidget extends StatelessWidget {
  const CartHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
              "ADDED PRODUCTS",
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
    );
  }
}