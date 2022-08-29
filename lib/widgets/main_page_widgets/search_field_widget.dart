import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFfaFFFF),
          borderRadius: BorderRadius.circular(32)
      ),
      margin: const EdgeInsets.all(8),
      height: 42,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            prefixIcon: const Icon(Icons.search_rounded),
            hintText: "Search",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            )
        ),
      ),
    );
  }
}