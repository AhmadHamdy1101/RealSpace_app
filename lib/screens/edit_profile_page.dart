import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/screens/home_page.dart';
import 'package:projects/screens/profile_page.dart';
import '../Widgets/customTextField.dart';
import '../constants/Colors.dart';


class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text('Edit Profile'),
      leading: BackButton(),),
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
                    )     ,             //   fields
                   Column(spacing: 20,children: [
                     CustomTextField(icon: FontAwesomeIcons.envelope,hintText: "HazemLotfy@gmail.com",Type: "Email",),
                     CustomTextField(icon: FontAwesomeIcons.mobileScreen,hintText: "+201128639417",Type: "Phone",),
                     CustomTextField(icon: FontAwesomeIcons.locationDot,hintText: "teraat el gabal",Type: "Address",),
                     CustomTextField(icon: FontAwesomeIcons.calendarDays,hintText: "30/9/2001",Type: "Birth Date",),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 38,vertical: 20),
                       width: MediaQuery.sizeOf(context).width,
                       child: FilledButton(
                           style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors_app.orange_color),padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 5))),
                           onPressed: () {

                       }, child: Text("Save",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)),
                     )
                   ],)
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


