/*
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WebServices{
  String baseUrl='https://www.metaweather.com';
  Future<int> getCityId(String cityName) async {
    Uri url =Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    http.Response respose =await http.get(url);
    List<Map<String,dynamic>> data =jsonDecode(respose.body);
    int cityId=data[0]['woeid'];
    print(cityId);
    return cityId;
  }
  Future<WeatherModel> getWeather(String cityName) async {
    int id=await getCityId(cityName);
    Uri url =Uri.parse('$baseUrl/api/location/$id/');
    http.Response respose =await http.get(url);
    Map<String,dynamic> jsonData =jsonDecode(respose.body);
    Map<String,dynamic> data=jsonData['consolidated_weather'][0];
    WeatherModel weatherData =WeatherModel.fromjson(data);
    return weatherData;
  }
}*/
