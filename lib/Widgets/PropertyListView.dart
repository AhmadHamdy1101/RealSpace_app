import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'card_wedget.dart';


class PropertyListView extends StatefulWidget {
  const PropertyListView({
    super.key, this.Direction, this.hight, this.Count,
  });
  final Direction ;
  final hight ;
  final Count ;

  @override
  State<PropertyListView> createState() => _PropertyListViewState();
}

class _PropertyListViewState extends State<PropertyListView> {
  @override
  Widget build(BuildContext context) {
    int itemsToShow = 10;

    return SizedBox(
      height: widget.hight,
      child: ListView.builder(itemCount: widget.Count,scrollDirection: widget.Direction,itemBuilder: (context, index) {
        return CardProperty(title: 'apartment 140M in new capital',bathrooms: 2,bedrooms: 2,location: 'new capital,cairo,egypt',price: "20,000,000",type: "House",);

        // cardProperty();

      },),
    );
  }
}

