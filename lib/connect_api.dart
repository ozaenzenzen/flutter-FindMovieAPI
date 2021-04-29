import 'dart:convert';
import 'package:flutter_api2/details_api.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter_api2/main.dart';

class ConnectAPI {
  // var t;
  // ConnectAPI({this.t});

  Future<DetailsAPI> getData(String t) async {
    var connectURL = "http://www.omdbapi.com/?t=" + t + "&apikey=30270331";
    // var connectURL = "http://www.omdbapi.com/?apikey=[30270331]&t=" + t;
    // var requestURL = "http://www.omdbapi.com/?t=The+Avengers";
    var response = await http.get(connectURL);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonObject = json.decode(response.body);
      // var jsonObject = json.decode(response.body);
      var isi = DetailsAPI.source(jsonObject);
      // var body = jsonObject[''];
      return isi;
    } else {
      throw ("Data tidak ditemukan");
    }
  }
}
