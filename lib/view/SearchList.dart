import 'dart:developer';
import 'package:shimmer/shimmer.dart';
import 'package:cricket/controller/SearchController.dart';
import 'package:cricket/controller/SearchList_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  SearchController searchController = Get.put(SearchController());
  TextEditingController search = TextEditingController();
  String values = '';
  List myName = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Match Search List'),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: search,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Colors.indigo.shade100,
                    hintText: 'Search Item'),
                onChanged: (value) {
                  values = value;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: SearchList_Controller.current_Match_Controller_api(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    log(myName.toString());
                    return ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        String items = snapshot.data!.data[index].name;
                        if (search.text.toString() == null) {
                          return ListTile(
                            title: Text(
                                snapshot.data!.data[index].name.toString()),
                            subtitle: Text(
                                snapshot.data!.data[index].country.toString()),
                          );
                        } else if (items.contains(search.text.toString())) {
                          return ListTile(
                            title: Text(
                                snapshot.data!.data[index].name.toString()),
                            subtitle: Text(
                                snapshot.data!.data[index].country.toString()),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  } else {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Color(0xF7EAE9E9),
                        highlightColor: Color(0xCFCCCCCC),
                        direction: ShimmerDirection.ltr,
                        period: const Duration(seconds: 2),
                        child: ListTile(
                          title: Container(height: 15,width: 60 ,decoration: ShapeDecoration(
                          color: Colors.grey[400]!,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                          ),),
                          subtitle: Container(height: 10,width: 100, decoration: ShapeDecoration(
                            color: Colors.grey[400]!,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                          ),),

                        ),
                      );
                    },);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
