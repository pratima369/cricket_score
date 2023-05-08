import 'dart:developer';
import 'package:cricket/controller/CurrentMatch_Controller.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrentMatch extends StatelessWidget {
  const CurrentMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
        ),
        body: FutureBuilder(
          future: current_Match_Controller.current_Match_Controller_api(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Container();
            }
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return Container();
              }
              else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25, top: 10),
                          child: Card(
                              elevation: 6,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.data![index].name.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data!.data![index]
                                                          .teamInfo![0].img)),
                                              Text(snapshot.data!.data![index]
                                                  .teamInfo![0].name
                                                  .toString()),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(snapshot.data!.data![index]
                                                  .teamInfo![0].shortname
                                                  .toString()),
                                              Text(
                                                'Vs',
                                                style: TextStyle(
                                                    color: Colors.indigo,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(snapshot.data!.data![index]
                                                  .teamInfo![1].shortname
                                                  .toString()),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data!.data![index]
                                                          .teamInfo![1].img)),
                                              Text(snapshot.data!.data![index]
                                                  .teamInfo![1].name
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.data![index].status
                                          .toString(),
                                      style: TextStyle(height: 2),
                                    ),
                                    Text(
                                      snapshot.data!.data![index].venue
                                          .toString(),
                                      style: TextStyle(height: 2),
                                    ),
                                    // SizedBox(
                                    //   height: 280,
                                    //   child: ListView.builder(
                                    //     itemCount: snapshot.data!.data![index].score!.length,
                                    //     itemBuilder: (context, index) {
                                    //       return Card(
                                    //         child: Column(
                                    //           crossAxisAlignment: CrossAxisAlignment.start,
                                    //           children: [
                                    //             Padding(
                                    //               padding: const EdgeInsets.all(8.0),
                                    //               child: Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.start,
                                    //                 children: [
                                    //                   const Text('r : '),
                                    //                   Text(snapshot
                                    //                       .data!.data![index].score![index].r
                                    //                       .toString()),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //             Padding(
                                    //               padding: const EdgeInsets.all(8.0),
                                    //               child: Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.start,
                                    //                 children: [
                                    //                   const Text('w : '),
                                    //                   Text(snapshot
                                    //                       .data!.data![index].score![index].w
                                    //                       .toString()),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //             Padding(
                                    //               padding: const EdgeInsets.all(8.0),
                                    //               child: Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.start,
                                    //                 children: [
                                    //                   const Text('o : '),
                                    //                   Text(snapshot
                                    //                       .data!.data![index].score![index].o
                                    //                       .toString()),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //             Padding(
                                    //               padding: const EdgeInsets.all(8.0),
                                    //               child: Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.start,
                                    //                 children: [
                                    //                   const Text('inning : '),
                                    //                   Text(snapshot.data!.data![index]
                                    //                       .score![index].inning
                                    //                       .toString()),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       const Text('series_id : '),
                                    //       Text(snapshot.data!.data![index].seriesId
                                    //           .toString()),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       const Text('fantasyEnabled : '),
                                    //       Text(snapshot.data!.data![index].fantasyEnabled
                                    //           .toString()),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       const Text('bbbEnabled : '),
                                    //       Text(snapshot.data!.data![index].bbbEnabled
                                    //           .toString()),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       const Text('hasSquad : '),
                                    //       Text(snapshot.data!.data![index].hasSquad
                                    //           .toString()),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       const Text('matchStarted : '),
                                    //       Text(snapshot.data!.data![index].matchStarted
                                    //           .toString()),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       const Text('matchEnded : '),
                                    //       Text(snapshot.data!.data![index].matchEnded
                                    //           .toString()),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Center(
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  snapshot.data!.data![index].date.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.indigo,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                        ),
                      ],
                    );
                  },
                );
              }
              else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Color(0xF7EAE9E9),
                      highlightColor: Color(0xCFCCCCCC),
                      direction: ShimmerDirection.ltr,
                      period: const Duration(seconds: 2),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 19, top: 6, left: 8, right: 8),
                            child: Card(
                              elevation: 10,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: ShapeDecoration(
                                  color: Colors.grey[400]!,
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            child: Center(
                              child: Container(
                                width: 80,
                                height: 50,
                                decoration: ShapeDecoration(
                                  color: Colors.grey[400]!,
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            }
            else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Color(0xF7EAE9E9),
                    highlightColor: Color(0xCFCCCCCC),
                    direction: ShimmerDirection.ltr,
                    period: const Duration(seconds: 2),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 19, top: 6, left: 8, right: 8),
                          child: Card(
                            elevation: 10,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: ShapeDecoration(
                                color: Colors.grey[400]!,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 50,
                              decoration: ShapeDecoration(
                                color: Colors.grey[400]!,
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }


          },
        ));
  }
}
