import 'package:flutter/material.dart';
import 'package:projects/models/supadart_header.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/property.dart';
import 'IconsListView.dart';
import 'PropertyListView.dart';
import 'searchBarWedget.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final supabase = Supabase.instance.client;

  List<Property> items = [];

  int itemsToShow = 6;

  Future<void> _fetchData() async {
    try {
      final response = await supabase.property.select().withConverter(
        Property.converter,
      );

      if (response.isNotEmpty) {
        setState(() {
          items = response;
        });
      } else {
        print("Supabase returned an empty list or null!");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMoreItems();
  }

  void _loadMoreItems() {
    setState(() {
      itemsToShow += 6;
      _fetchData();
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
              Padding(
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
                    PropertyListView(
                      hight: MediaQuery.sizeOf(context).height * 0.411,
                      Direction: Axis.horizontal,
                      Count: items.length,
                      property: items,
                    ),
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
                    PropertyListView(
                      hight: MediaQuery.sizeOf(context).height * 0.411,
                      Direction: Axis.horizontal,
                      Count: items.length,
                      property: items,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
