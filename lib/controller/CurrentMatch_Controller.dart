// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:cricket/model/CurrentMatch.dart';
import 'package:http/http.dart' as http;

class current_Match_Controller {
  static Future current_Match_Controller_api() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.cricapi.com/v1/currentMatches?apikey=f8c2f362-7320-44ea-b5f5-16a3a379e6cb&offset=0'));
      final data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return CurrentMatch.fromJson(data);
      } else {
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
