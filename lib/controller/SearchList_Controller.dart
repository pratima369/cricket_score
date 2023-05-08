
import 'dart:convert';
import 'dart:developer';
import 'package:cricket/model/searchList.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SearchList_Controller extends GetxController {
  static Future<searchList> current_Match_Controller_api() async {
    String url =
        'https://api.cricapi.com/v1/players?apikey=f8c2f362-7320-44ea-b5f5-16a3a379e6cb&offset=0';
    var response = await http.get(Uri.parse(url));

    final dynamic data = jsonDecode(response.body.toString());

    try {
      if (response.statusCode == 200) {
        return searchList.fromJson(data);
      } else {
        return searchList.fromJson(data);
      }
    } catch (e) {
      log(e.toString());
      return searchList.fromJson(data);
    }
  }
}
