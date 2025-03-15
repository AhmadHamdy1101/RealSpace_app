import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Widgets/card_wedget.dart';
import '../Widgets/searchBarWedget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final supabase = Supabase.instance.client;

  List<dynamic> items = [];
  int itemsToShow = 6;

  Future<void> _fetchData() async {
    final response = await supabase
        .from('property')
        .select()
        .limit(itemsToShow);

    setState(() {
      items = response;
    });
    print(response);
  }

  void _loadMoreItems() {
    setState(() {
      itemsToShow += 6;
      _fetchData();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
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
            height: MediaQuery.sizeOf(context).height * 0.61,
            child: ListView.builder(
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (index < items.length) {
                  final item = items[index];
                  return CardProperty(
                    title: item['title'],
                    location: item['location'].toString(),
                    bedrooms: item['bedrooms'],
                    bathrooms: item['bathrooms'],
                    price: item['price'].toString(),
                    type: item['type'],
                  );
                } else {
                  return items.length >= itemsToShow
                      ? ElevatedButton(
                    onPressed: _loadMoreItems,
                    child: const Text('See More'),
                  )
                      : const SizedBox.shrink();
                }
              },
            ),
          ),
        ]),
      )
    ]);
  }
}



