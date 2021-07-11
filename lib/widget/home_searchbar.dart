import 'package:flutter/material.dart';

Widget actionAppbar(bool isSearching, Function setState) {
  return isSearching
      ? IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              isSearching = false;
            });
          },
        )
      : IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              isSearching = true;
            });
          },
        );
}