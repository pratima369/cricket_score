import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeScreen.dart';


class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
     setState(() {

     });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height*1,
        width: double.infinity,
        child: Image.asset('assets/loding.gif',fit: BoxFit.fill),
      ),
    );
  }
}

