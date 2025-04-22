
import 'package:flutter/material.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/utils/app_text_style.dart';

class CustomExpandedButton extends StatelessWidget {
  const CustomExpandedButton({
    super.key, this.onpressed,
  });

  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors_app.orange_color,
          ),
          overlayColor: WidgetStatePropertyAll(
            Colors_app.orange_color,
          ),
        ),
        child: Text(
            "Start",
            style: AppStyles.styleSeprodisplayRegural36(context)
        ),
      ),
    );
  }
}