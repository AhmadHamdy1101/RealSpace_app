import 'package:flutter/material.dart';
import 'package:projects/Widgets/card_wedget.dart';


class PropertyListView extends StatelessWidget {
  const PropertyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 400,
      child: ListView.builder(itemCount: 6,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
        return CardProperty();

        // cardProperty();

      },),
    );
  }
}

