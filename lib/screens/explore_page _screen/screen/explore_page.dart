import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/screens/home_page_screen/screen/viewmodel/home_page_cubit.dart';

import '../../../utils/Widgets/card_wedget.dart';
import '../../../utils/Widgets/searchBarWedget.dart';



class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {


  int itemsToShow = 6;


  void _loadMoreItems() {
    setState(() {
      itemsToShow += 6;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SearchBar_wedget(),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Explorer Property",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery
                .sizeOf(context)
                .height * 0.61,
            child: BlocConsumer<HomePageCubit, HomePageState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is HomePageLoading){
                  return CircularProgressIndicator();
                }else if (state is HomePageSuccess){
                  return ListView.builder(
                    itemCount: state.finaldata.length + 1,
                    itemBuilder: (context, index) {
                      if (index < state.finaldata.length) {
                        final item = state.finaldata[index];
                        return CardProperty(
                          property: state.finaldata[index].property,
                            photos: state.finaldata[index].photo
                        );
                      } else {
                        return state.finaldata.length >= itemsToShow
                            ? ElevatedButton(
                          onPressed: _loadMoreItems,
                          child: const Text('See More'),
                        )
                            : const SizedBox.shrink();
                      }
                    },
                  );
                }
                else if (state is HomePageFailure){
                  return CircularProgressIndicator();
                }else{
                  return Text("falid");

                }

              },
            ),
          ),
        ]),
      )
    ]);
  }
}



