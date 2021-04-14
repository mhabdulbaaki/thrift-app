import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:google_place/google_place.dart';

final String url = "https://maps.googleapis.com/maps/api/place/details/json?";
const String geometry = "geometry";
const String location = 'location';
const String result = 'result';
const String place_id = 'place_id';
const String fields = 'fields';
const String parameterKey = 'key';
final String key = DotEnv.env['API_KEY'];
var dio = Dio();

class PlaceDetail {
  final String placeId;
  Location _location;
  PlaceDetail({@required this.placeId});

  Future<Location> getLocation() async {
    Response response = await dio.get(url, queryParameters: {
      parameterKey: key,
      fields: geometry,
      place_id: this.placeId
    });

    Map<String, dynamic> locationMap =
        response.data[result][geometry][location];
    _location = Location.fromJson(locationMap);
    return _location;
  }
}
