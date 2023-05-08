import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SearchList_Controller.dart';

class SearchController extends GetxController{
  RxString value = ''.obs;

  final search = TextEditingController().obs;
    searchList(String value){
    search.value.text = value;
  }
}