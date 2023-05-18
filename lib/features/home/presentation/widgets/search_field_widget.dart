import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blueGrey,
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Search',
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(),
        fillColor: Theme.of(context).appBarTheme.backgroundColor,
        focusColor: Colors.grey,
        hoverColor: Colors.grey,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
      ),
    );
  }
}
