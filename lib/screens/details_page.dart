import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projects/screens/home_page.dart';
import '../constants/Colors.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_app.white_color,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
        Column(
            children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.4,
            child: PageView(children: [
              Image.network("https://cdn.pixabay.com/photo/2023/10/06/07/58/kitchen-8297678_1280.jpg",fit: BoxFit.cover,),
              Image.network("https://cdn.pixabay.com/photo/2017/04/10/22/28/residence-2219972_1280.jpg",fit: BoxFit.cover)
            ],),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        padding: EdgeInsets.symmetric(vertical:5,horizontal: 9 ),
                        decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.house,size: 15,color: Colors_app.orange_color,),
                            SizedBox(width: 10,),
                            Text('House',style: TextStyle(fontWeight: FontWeight.bold,color: Colors_app.orange_color,fontSize: 15),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Apartment 160M² in mostakbal city".toUpperCase(),overflow: TextOverflow.clip,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                  SizedBox(height: 6,),
                  Row(children: [
                    Icon(FontAwesomeIcons.locationDot,color: Colors.grey[400],size: 20,),
                    SizedBox(width: 5,),
                    Text("New Cairo,Cairo,Egypt",textAlign:TextAlign.left,style: TextStyle(fontSize:20,color: Colors.grey[400],fontWeight: FontWeight.bold ))
                  ]
                  ),
                  SizedBox(height: 20,),
                  Row(spacing:12,children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors_app.white_color,boxShadow: [BoxShadow(color: Colors_app.gray_color,blurRadius: 1)],borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.bed),
                          SizedBox(height: 5,),
                          Text('4 bedroom')
                        ],),),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors_app.white_color,boxShadow: [BoxShadow(color: Colors_app.gray_color,blurRadius: 1)],borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.shower),
                          SizedBox(height: 5,),
                          Text('4 bathroom')
                        ],),),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors_app.white_color,boxShadow: [BoxShadow(color: Colors_app.gray_color,blurRadius: 1)],borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.maximize),
                          SizedBox(height: 5,),
                          Text('160 Acres')
                        ],),),
                  ],),
                  SizedBox(height: 10,),
                  Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 10,),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in'
                    ,style: TextStyle(color: Colors_app.darkgray_color),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(spacing:10,children: [
                        SizedBox(width: 50,height: 50,child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network('https://cdn.pixabay.com/photo/2020/06/26/14/46/india-5342927_1280.jpg',fit: BoxFit.cover,))),
                        Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                          Text('Ahmed Hamdy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text("Property Consultant")
                        ],)
                      ],),
                      Row(children: [
                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors_app.orange_color),child: IconButton(onPressed: () { }, icon: Icon(FontAwesomeIcons.message,color: Colors_app.white_color,))),
                        SizedBox(width: 9,),

                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors_app.orange_color),child: IconButton(onPressed: () { }, icon: Icon(FontAwesomeIcons.phone,color: Colors_app.white_color,))),


                      ],)
                    ],),
                  SizedBox(height: 25,),
                  Text("Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("New Cairo,Cairo,Egypt",textAlign:TextAlign.left,style: TextStyle(fontSize:20,color: Colors.grey[400],fontWeight: FontWeight.bold )),
                  SizedBox(height: 20,)



                ],
              ),
            ),
          ),

        ]),
        Positioned(
          top: 50,
          child: Container(
          width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(decoration:BoxDecoration(color: Colors_app.white_color,borderRadius: BorderRadius.circular(50)),child: IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
               return HomePage();
              },));}, icon: Icon(FontAwesomeIcons.chevronLeft,color: Colors_app.orange_color,))),
              Text("details".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Container(decoration:BoxDecoration(color: Colors_app.white_color,borderRadius: BorderRadius.circular(50)),child: IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.heart,color: Colors_app.orange_color,))),

            ],),
          ),
        )
      ],

      ),
      )
      ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors_app.white_color,boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2),blurRadius: 10,spreadRadius: 2)]),
        padding: EdgeInsets.symmetric(horizontal: 30),
        height:90,child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("20,000,000EGP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        ElevatedButton(onPressed: (){},style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors_app.orange_color),foregroundColor: WidgetStatePropertyAll(Colors_app.white_color)), child: Text("Book now"),)
      ],),)
    
    );
  }
}
