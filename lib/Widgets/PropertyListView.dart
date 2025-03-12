import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projects/Widgets/card_wedget.dart';
import 'package:projects/screens/explore_page.dart';


class PropertyListView extends StatelessWidget {
  const PropertyListView({
    super.key, this.Direction, this.hight, this.Count,
  });
  final Direction ;
  final hight ;
  final Count ;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: hight,
      child: ListView.builder(itemCount: Count,scrollDirection: Direction,itemBuilder: (context, index) {
        return CardProperty(url: ExplorePage(),title: 'apartment 140M in new capital',bathrooms: "2",bedrooms: "2",location: 'new capital,cairo,egypt',price: "20,000,000",type: "House",);

        // cardProperty();

      },),
    );
  }
}

