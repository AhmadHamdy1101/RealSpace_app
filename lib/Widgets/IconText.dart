import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key, required this.text, required this.icons, required this.color,
  });
final String text;
final IconData icons;
final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(onTap: () {  },child: Container(width: 50, height: 50,decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(50)), child: Icon(icons,color: color,),),),
        Text(text),
      ],
    );
  }
}