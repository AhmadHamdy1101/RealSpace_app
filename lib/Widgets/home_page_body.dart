import 'package:flutter/material.dart';


import 'IconsListView.dart';
import 'PropertyListView.dart';
import 'searchBarWedget.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: IconsListView()),
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(children: [
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Property",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    TextButton(onPressed: () {} , child: Text("See More"),)
                  ],
                ),
                PropertyListView(hight: MediaQuery.sizeOf(context).height*0.411,Direction: Axis.horizontal,Count: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("New Property",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    TextButton(onPressed: () {} , child: Text("See More"),)
                  ],
                ),
                SizedBox(height: 15,),
                PropertyListView(hight: MediaQuery.sizeOf(context).height*0.411,Direction: Axis.horizontal,Count: 6),


              ],),
            ),


          ],),
          )]
    );
  }
}