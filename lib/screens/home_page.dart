
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:projects/screens/explore_page.dart';
import 'package:projects/screens/edit_profile_page.dart';
import 'package:projects/screens/profile_page.dart';

import '../Widgets/home_page_body.dart';
import '../constants/Colors.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final PageController _pageController = PageController();
final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text('Real Space', style: TextStyle(color: Colors_app.orange_color, fontWeight: FontWeight.bold),),
        leading:IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: (){},),
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.bell), onPressed: (){},),

        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          currentIndex.value = value;
        },
        children: [HomePageBody(),ExplorePage(),Text("heeeelp"),Profile_page()],),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            currentIndex.value = value;
            setState(() {

            });
            _pageController.jumpToPage(currentIndex.value);
          }

          ,
          selectedIndex: currentIndex.value,
          backgroundColor: Colors_app.white_color,indicatorColor: Colors.orangeAccent,destinations:const <Widget>[
          NavigationDestination(icon: Icon(FontAwesomeIcons.house), label: 'Home',            selectedIcon: Icon(FontAwesomeIcons.house,color: Colors_app.white_color,),
          ),
          NavigationDestination(icon: Icon(FontAwesomeIcons.wpexplorer), selectedIcon: Icon(FontAwesomeIcons.wpexplorer,color: Colors_app.white_color,), label: 'Explore'),
          NavigationDestination(
            selectedIcon: Icon(FontAwesomeIcons.heart,color: Colors_app.white_color,),
            icon: Icon(FontAwesomeIcons.heart),
            label: 'Saved',
          ),
          NavigationDestination(icon: Icon(FontAwesomeIcons.user),selectedIcon: Icon(FontAwesomeIcons.user,color: Colors_app.white_color,),label: 'Profile'),

        ], ),
    );
  }
}









