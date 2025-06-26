import 'package:flutter/material.dart';

class SearchBar_wedget extends StatelessWidget {
  const SearchBar_wedget ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search',
      shadowColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(Colors.white),);
  }
}