import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'IconText.dart';

class IconsListView extends StatelessWidget {
  const IconsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:100,child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView( scrollDirection: Axis.horizontal ,children: [SizedBox(width: 20,),
        IconText(color: Colors.orangeAccent,icons: FontAwesomeIcons.house,text: "House",),
        SizedBox(width: 20,),
        IconText(text: 'Apartment', icons: FontAwesomeIcons.solidBuilding, color: Colors.purple),
        SizedBox(width: 15,),
        IconText(text: 'Townhouse', icons: FontAwesomeIcons.city, color: Colors.red[700]!),
        SizedBox(width: 15,),
        IconText(text: 'Warehouse', icons: FontAwesomeIcons.warehouse, color: Colors.blueAccent),
        SizedBox(width: 15,),
        IconText(text: 'Empty Land', icons: Icons.nature_people, color: Colors.green),

      ],),
    ),);
  }
}

