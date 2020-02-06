import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = "AIzaSyBQMxlQIynulW-Vuti2UOrWTtXrCWw2onc";

class GoogleMapServices {
  //android ==>  AIzaSyBQMxlQIynulW-Vuti2UOrWTtXrCWw2onc

  //  ios ===>  [GMSServices provideAPIKey:@"AIzaSyDYoPgEm9SEEZg3vo8SoZ26wjXtYwJ8LsU"];

  Future<String> getRouteCoordiantes(LatLng l1, LatLng l2) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&alternatives=true&key=$apiKey";
    http.Response response = await http.get(url);
    Map value = jsonDecode(response.body);
    return value["routes"][0]["overview_polyline"]["points"];
  }

  //   Future<String> getRouteCoordiantes(LatLng l1, LatLng l2) async {
  //   String url =
  //       "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination&alternatives=true=${l2.latitude},${l2.longitude}&key=$apiKey";
  //   http.Response response = await http.get(url);
  //   Map value = jsonDecode(response.body);
  //   print(value["routes"]['legs']["waypoint_order"][0]);
  //   return value["routes"]['legs']["waypoint_order"][0];
  // }
}
