
import 'package:flutter/material.dart';
import 'package:projects/models/property.dart';
import 'card_wedget.dart';

class PropertyListView extends StatefulWidget {
  const PropertyListView({super.key, this.Direction, this.hight, this.Count, required this.property,});

  final Direction;

  final hight;

  final Count;

  final List<Property> property;


  @override
  State<PropertyListView> createState() => _PropertyListViewState();
}

class _PropertyListViewState extends State<PropertyListView> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.hight,
      child: ListView.builder(

        itemCount: widget.Count,
        scrollDirection: widget.Direction,
        itemBuilder: (context, index)  {
          return CardProperty(
              property: widget.property[index],
            photos: [],

          );

          // cardProperty();
        },
      ),
    );
  }
}
