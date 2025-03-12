
import 'package:flutter/material.dart';

import '../Widgets/PropertyListView.dart';
import '../Widgets/searchBarWedget.dart';


class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});



  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column( children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: SearchBar_wedget(),
            ),
            SizedBox(height: 15,),

            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(children: [
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explorer Property",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    TextButton(onPressed: () {} , child: Text("See More"),)
                  ],
                ),
                PropertyListView(Direction: Axis.vertical,hight: MediaQuery.sizeOf(context).height, Count: 10,),



              ],),
            ),


          ],),
          )]
    );
  }
}









