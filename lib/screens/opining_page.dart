import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/screens/starting_page.dart';
import 'package:projects/utils/app_text_style.dart';
import '../utils/Widgets/custom_expanded_button_widget.dart';

class OpiningPage extends StatelessWidget {
  const OpiningPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors_app.white_color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SvgPicture.asset(
              'assets/images/logo vertical.svg',
              color: Colors_app.orange_color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Text(
              "Let’s find your dream house!",
              softWrap: true,
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleSeprodisplayHave50(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Ready to start fresh in a new location? Propyrite is here to guide you on your journey!",
              textAlign: TextAlign.center,
              style: AppStyles.styleSeprodisplayRegural20(context),
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Row(
              children: [
                CustomExpandedButton(onpressed: (){Get.to(StartingPage());} ,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

