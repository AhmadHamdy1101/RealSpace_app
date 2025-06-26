import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/screens/home_page_screen/screen/viewmodel/home_page_cubit.dart';

import '../../../../utils/Widgets/IconsListView.dart';
import '../../../../utils/Widgets/PropertyListView.dart';
import '../../../../utils/Widgets/searchBarWedget.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {


  int itemsToShow = 6;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomePageCubit>().fetchData();
    _loadMoreItems();
  }

  void _loadMoreItems() {
    setState(() {
      itemsToShow += 6;
      // _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: SearchBar_wedget(),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Expanded(child: IconsListView())],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Property",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: Text("See More")),
                  ],
                ),

                BlocConsumer<HomePageCubit, HomePageState>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    if (state is HomePageLoading) {
                      return CircularProgressIndicator();
                    }
                    else if (state is HomePageSuccess) {
                      return PropertyListView(
                        hight: MediaQuery
                            .sizeOf(context)
                            .height * 0.411,
                        Direction: Axis.horizontal,
                        Count: state.finaldata.length,
                        finalData: state.finaldata,
                      );
                    }
                    else if (state is HomePageFailure) {
                      return Text('fail');
                    }
                    else
                      {return CircularProgressIndicator();}
                  },
                ),

              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Property",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: Text("See More")),
                  ],
                ),
                SizedBox(height: 15),
                BlocConsumer<HomePageCubit, HomePageState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is HomePageLoading){
                      return CircularProgressIndicator();
                    }else if(state is HomePageSuccess){
                      return PropertyListView(
                        hight: MediaQuery
                            .sizeOf(context)
                            .height * 0.411,
                        Direction: Axis.horizontal,
                        Count: state.finaldata.length,
                        finalData: state.finaldata,
                      );
                    }else if (state is HomePageFailure){
                      return Text("failuer");
                    }else{
                      return CircularProgressIndicator();

                    }

                  },
                ),
              ],
            ),


        )
      ],
    );
  }
}
