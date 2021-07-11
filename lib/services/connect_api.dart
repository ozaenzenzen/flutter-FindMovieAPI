import 'dart:convert';
import 'package:flutter_api2/model/details_api.dart';
import 'package:http/http.dart' as http;

class ConnectAPI {
  Future<DetailsAPI> getData(String t) async {
    var connectURL = "https://www.omdbapi.com/?t=" + t + "&apikey=30270331";
    // var connectURL = "http://www.omdbapi.com/?apikey=[30270331]&t=" + t;
    // var requestURL = "http://www.omdbapi.com/?t=The+Avengers";

    var response = await http.get(connectURL);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonObject = json.decode(response.body);
      var apiData = DetailsAPI.source(jsonObject);
      return apiData;
    } else {
      throw ("Data tidak ditemukan");
    }
  }
}
