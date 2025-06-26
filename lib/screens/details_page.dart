import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projects/models/photo.dart';
import 'package:projects/models/property.dart';
import 'package:projects/screens/home_page_screen/screen/home_page.dart';
import 'package:projects/screens/home_page_screen/screen/viewmodel/home_page_cubit.dart';
import '../constants/Colors.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.property, required this.photo});
final Property property;
final List<Photo> photo;

  @override
  Widget build(BuildContext context) {
  var cubit = context.read<HomePageCubit>();
    return Scaffold(
      backgroundColor: Colors_app.white_color,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
        BlocConsumer<HomePageCubit, HomePageState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    if (state is HomePageLoading){
      return CircularProgressIndicator();
    }else if (state is HomePageSuccess){
      return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height*0.4,
              child: PageView(children: photo.map((e){
                return Image.network(e.url?? '',fit: BoxFit.cover,);
              }).toList() ,),
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

                          padding: EdgeInsets.symmetric(vertical:5,horizontal: 9 ),
                          decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.house,size: 15,color: Colors_app.orange_color,),
                              SizedBox(width: 10,),
                              Text(property.type??'',style: TextStyle(fontWeight: FontWeight.bold,color: Colors_app.orange_color,fontSize: 15),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("${property.title}".toUpperCase(),overflow: TextOverflow.clip,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                    SizedBox(height: 6,),
                    Row(children: [
                      Icon(FontAwesomeIcons.locationDot,color: Colors.grey[400],size: 20,),
                      SizedBox(width: 5,),
                      Text("${property.location},Egypt",textAlign:TextAlign.left,style: TextStyle(fontSize:20,color: Colors.grey[400],fontWeight: FontWeight.bold ))
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
                            Text('${property.bedroom} bedroom')
                          ],),),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(color: Colors_app.white_color,boxShadow: [BoxShadow(color: Colors_app.gray_color,blurRadius: 1)],borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(FontAwesomeIcons.shower),
                            SizedBox(height: 5,),
                            Text('${property.bathroom} bathroom')
                          ],),),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(color: Colors_app.white_color,boxShadow: [BoxShadow(color: Colors_app.gray_color,blurRadius: 1)],borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(FontAwesomeIcons.maximize),
                            SizedBox(height: 5,),
                            Text('${property.area} Acres')
                          ],),),
                    ],),
                    SizedBox(height: 10,),
                    Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 10,),
                    Text(
                      '${property.description}'
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
                    Text("${property.location},Egypt",textAlign:TextAlign.left,style: TextStyle(fontSize:20,color: Colors.grey[400],fontWeight: FontWeight.bold )),
                    SizedBox(height: 20,)



                  ],
                ),
              ),
            ),

          ]);
    }
    else if (state is HomePageFailure){
      return CircularProgressIndicator();
    }
    else {
      return Text("falid");
    }

  },
),
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
