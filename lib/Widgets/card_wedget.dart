import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/functions/Capitalize_String.dart';
import 'package:projects/screens/details_page.dart';

class CardProperty extends StatelessWidget {
  const CardProperty({
    super.key, required this.title, required this.location, required this.bedrooms, required this.bathrooms, required this.price, required this.type,
  });
final String title;
final String location;
final String bedrooms;
final String bathrooms;
final String price;
final String type;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailsPage());

      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width*0.8,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[80]
                 ),
                child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Stack(
                          children: [

                            ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network("https://cdn.pixabay.com/photo/2024/04/23/11/55/kitchen-8714865_1280.jpg",height: MediaQuery.sizeOf(context).height*0.23,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover, )),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical:5,horizontal: 9 ),
                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.house,size: 13,color: Colors_app.orange_color,),
                                        SizedBox(width: 10,),
                                        Text(type,style: TextStyle(fontWeight: FontWeight.bold,color: Colors_app.orange_color),)
                                      ],
                                    ),
                                  ),
                                  Container(width: 35,height: 35,decoration: BoxDecoration(color: Colors_app.white_color, borderRadius:BorderRadius.circular(50),),child: IconButton(iconSize: 20,onPressed: () {

                                  },icon: Icon(FontAwesomeIcons.heart), color: Colors_app.orange_color,)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Text(title.toTitleCase,overflow: TextOverflow.ellipsis,maxLines: 1,textAlign:TextAlign.left,style: TextStyle(fontSize:19,fontWeight: FontWeight.bold,)),
                  ),

                      SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(children: [
                      Icon(FontAwesomeIcons.locationDot,color: Colors.grey[400],size: 20,),
                      SizedBox(width: 5,),
                      Text(location,textAlign:TextAlign.left,style: TextStyle(fontSize:20,color: Colors.grey[400] ))
                    ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(children: [
                      Icon(FontAwesomeIcons.bed),
                      SizedBox(width: 10,),
                      Text('$bedrooms'),
                      SizedBox(width: 20,),
                      Icon(FontAwesomeIcons.sink),
                      SizedBox(width: 10,),
                      Text('$bathrooms'),
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.12,),
                      FittedBox(fit:BoxFit.scaleDown,child: Text(price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                    ],),
                  ),
                ]),),
            ),


          ]
        ),
      ),
    );
  }
}
