
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, this.Type, this.hintText, this.icon,
  });
final Type;
final hintText;
final icon;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 35),child: Column(spacing:10,crossAxisAlignment: CrossAxisAlignment.start,children: [
      Text(Type,style: TextStyle(fontSize: 25),),
      Card(
          margin: EdgeInsets.all(0),
          elevation: 2,
          color: Colors.white,
          child: TextField(decoration: InputDecoration(suffixIcon: Icon(icon),
              hintText: hintText,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              )
          ))
      )

    ],),);
  }
}