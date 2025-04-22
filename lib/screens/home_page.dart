
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:projects/screens/explore_page.dart';
import 'package:projects/screens/edit_profile_page.dart';
import 'package:projects/screens/login_page.dart';
import 'package:projects/screens/profile_page.dart';

import '../Widgets/home_page_body.dart';
import '../Widgets/profile_button_wedget.dart';
import '../constants/Colors.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final PageController _pageController = PageController();
final currentIndex = 0.obs;
GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: Drawer(
        backgroundColor: Colors_app.orange_color,
        child:  Container(
          width: MediaQuery.sizeOf(context).width,

          child: Column(spacing: 30,crossAxisAlignment: CrossAxisAlignment.center,children: [
            Container(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  spacing: 15,
                  children: [
                  Container(

                    decoration: BoxDecoration(

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 20, // Blur radius
                          offset: Offset(0, 10), // Shadow position
                        ),
                      ],
                      border: Border.all(color: Colors_app.orange_color,width: 5),
                      borderRadius: BorderRadius.circular(500), // Match the ClipRRect border radius
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2020/06/26/14/46/india-5342927_1280.jpg",
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text("Hi,Ahmed Hamdy",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                ],),
              ),
            ),//   fields
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors_app.white_color , borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                padding: EdgeInsets.only(top: 10,bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Column(
                     spacing:20,
                     children: [
                     Profile_button(
                       onpress:(){ Get.to(EditProfilePage());},
                       icon: FontAwesomeIcons.pen,
                       text: "Edit Profile",
                     ),
                     Profile_button(
                       onpress: (){},
                       icon: FontAwesomeIcons.key,
                       text: "Change Password",
                     ),

                   ],),
                    Profile_button(
                      onpress: (){Get.to(LoginPage());},
                      text: "Log out",
                      icon: FontAwesomeIcons.rightFromBracket,
                    ),
                  ],
                ),
              ),
            )
          ],),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 5,
          children: [
            SvgPicture.asset('assets/images/yellow icon.svg',width: 50,color: Colors_app.orange_color,),
            Text("Real Space",style: TextStyle(fontFamily: "amin",fontWeight: FontWeight.bold,color: Colors_app.orange_color,fontSize: 25)),
          ],
        ),
        leading:Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
        children: [HomePageBody(),ExplorePage(),Text("heeeelp")],),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            currentIndex.value = value;
            setState(() {

            });
            _pageController.jumpToPage(currentIndex.value);
          }

          ,
          selectedIndex: currentIndex.value,
          backgroundColor: Colors_app.white_color,indicatorColor: Colors_app.orange_color,destinations:const <Widget>[
          NavigationDestination(icon: Icon(FontAwesomeIcons.house), label: 'Home',            selectedIcon: Icon(FontAwesomeIcons.house,color: Colors_app.white_color,),
          ),
          NavigationDestination(icon: Icon(FontAwesomeIcons.wpexplorer), selectedIcon: Icon(FontAwesomeIcons.wpexplorer,color: Colors_app.white_color,), label: 'Explore'),
          NavigationDestination(
            selectedIcon: Icon(FontAwesomeIcons.heart,color: Colors_app.white_color,),
            icon: Icon(FontAwesomeIcons.heart),
            label: 'Saved',
          ),

        ], ),
    );
  }
}









