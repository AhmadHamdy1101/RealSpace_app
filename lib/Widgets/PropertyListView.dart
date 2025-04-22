
import 'package:flutter/material.dart';
import 'package:projects/models/location.dart';
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
    int itemsToShow = 10;

    return SizedBox(
      height: widget.hight,
      child: ListView.builder(

        itemCount: widget.Count,
        scrollDirection: widget.Direction,
        itemBuilder: (context, index)  {
          return CardProperty(
            title: widget.property[index].title!,
            bathrooms: widget.property[index].bathroom!.toString(),
            bedrooms: widget.property[index].bedroom!.toString(),
            location: widget.property[index].location!,
            price: widget.property[index].price!.toString(),
            type: widget.property[index].type!,
            area: widget.property[index].area!.toString(),
          );

          // cardProperty();
        },
      ),
    );
  }
}
