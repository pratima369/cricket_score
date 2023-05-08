import 'package:flutter/material.dart';

import 'CurrentMatch.dart';
import 'SearchList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cricket Score'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          buildPadding(context, const CurrentMatch(), Colors.indigo.shade300,
              'Current Match'),
          buildPadding(context, const SearchList(), Colors.indigo.shade300,
              'Match Search List'),

    ]));
  }

  Padding buildPadding(context, Widget myWidget, Color colorData, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Card(
        color: colorData,
        elevation: 10,
        shape: OutlineInputBorder(

            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),

        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(image: AssetImage(
          //     'assets/image1.webp'
          //   ),fit: BoxFit.cover)
          // ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myWidget,
                  ));
            },
            child: Container(
              // decoration: BoxDecoration(
              //     image: DecorationImage(image: AssetImage(
              //         'assets/image1.webp'
              //     ),fit: BoxFit.cover)
              // ),
              height: 80,
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
