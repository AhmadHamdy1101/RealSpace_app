import 'package:flutter/material.dart';
import 'package:projects/utils/app_text_style.dart';

import '../../constants/Colors.dart';

class Profile_button extends StatelessWidget {
  const Profile_button({
    super.key, this.icon, this.text, this.onpress,
  });
  final icon;
  final text;
  final onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors_app.blcak_color),backgroundColor: WidgetStatePropertyAll(Colors.transparent),overlayColor: WidgetStatePropertyAll(Colors.transparent),elevation: WidgetStatePropertyAll(0) ),
      onPressed: onpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors_app.white_color,borderRadius: BorderRadius.circular(50)),
            child: Icon(icon,color: Colors_app.orange_color,size: 25,),
          ),
          Text(text,style: AppStyles.styleBoldBlack20(context),)
        ],),
    );
  }
}