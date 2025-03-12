import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/screens/details_page.dart';
import 'package:projects/screens/home_page.dart';

void main() {
  runApp(const RealSpace());
}

class RealSpace extends StatelessWidget {
  const RealSpace({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "outfit"),
      home: HomePage(),
      debugShowCheckedModeBanner: false,

    );
  }
}
