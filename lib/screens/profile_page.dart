import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/screens/edit_profile_page.dart';
import '../constants/Colors.dart';
import '../utils/Widgets/profile_button_wedget.dart';


class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_app.white_color,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(spacing: 30,crossAxisAlignment: CrossAxisAlignment.center,children: [
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
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text("Hi,Ahmed Hamdy",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),//   fields
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                     child: Column(
                       children: [
                         Column(spacing: 40,children: [
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
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.25,),
                          Profile_button(
                            onpress: (){},
                            text: "Log out",
                            icon: FontAwesomeIcons.rightFromBracket,
                          ),
                       ],
                     ),
                   )
                  ],),
                )

        
      ],

      ),
      )
      ],
      ),

    
    );
  }
}




