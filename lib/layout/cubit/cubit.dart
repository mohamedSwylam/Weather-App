import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  String baseUrl='https://www.metaweather.com';
  Future<int> getCityId(String cityName) async {
    Uri url =Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    http.Response respose = await http.get(url);
    List<dynamic> data = jsonDecode(respose.body);
    int cityId=data[0]['woeid'];
    print(cityId);
    return cityId;
  }

  WeatherModel? weatherData;
  Future<WeatherModel> getWeather(String cityName) async {
    int id=await getCityId(cityName);
    Uri url =Uri.parse('$baseUrl/api/location/$id/');
    http.Response respose =await http.get(url);
    Map<String,dynamic> jsonData =jsonDecode(respose.body);
    Map<String,dynamic> data=jsonData['consolidated_weather'][0];
    weatherData =WeatherModel.fromjson(data);
    emit(GetWeatherState());
    return weatherData!;
  }
  String ?cityName;
  String ?getImage(weather_state_name) {
    if (weather_state_name =='Snow')
    return 'https://img.icons8.com/external-wanicon-lineal-color-wanicon/344/external-snow-christmas-day-wanicon-lineal-color-wanicon.png';
    else if (weather_state_name =='Sleet')
      return 'https://img.icons8.com/external-tulpahn-outline-color-tulpahn/344/external-sleet-weather-tulpahn-outline-color-tulpahn.png';
    else if (weather_state_name =='Hail')
      return 'https://img.icons8.com/external-justicon-flat-justicon/344/external-hail-weather-justicon-flat-justicon.png';
    else if (weather_state_name =='Thunderstorm')
      return 'https://img.icons8.com/external-justicon-flat-justicon/344/external-thunderstorm-weather-justicon-flat-justicon.png';
    else if (weather_state_name =='Heavy Rain')
      return 'https://img.icons8.com/color-glass/344/heavy-rain.png';
    else if (weather_state_name =='Light Rain')
      return 'https://img.icons8.com/external-justicon-flat-justicon/344/external-thunderstorm-weather-justicon-flat-justicon.png';
    else if (weather_state_name =='Showers')
      return 'https://img.icons8.com/ios-filled/344/heavy-rain.png';
    else if (weather_state_name =='Heavy Cloud')
      return 'https://img.icons8.com/fluency/344/cloud.png';
    else if (weather_state_name =='Light Cloud')
      return 'https://img.icons8.com/fluency/344/cloud.png';
    else if (weather_state_name =='Clear')
      return 'https://img.icons8.com/fluency/344/sun.png';
    else{
      return 'https://icons8.com/icons/set/cloud';
    }
  }
  MaterialColor? getThemeColor() {
    if (weatherData!.weather_state_name =='Clear' || weatherData!.weather_state_name =='Light Cloud'){
    return Colors.orange;
    } else if (weatherData!.weather_state_name == 'Sleet' ||
        weatherData!.weather_state_name == 'Snow' ||
        weatherData!.weather_state_name== 'Hail') {
  return Colors.blue;
  } else if (weatherData!.weather_state_name == 'Heavy Cloud') {
  return Colors.blueGrey;
    }
else if (weatherData!.weather_state_name == 'Light Rain' ||
        weatherData!.weather_state_name =='Heavy Rain' || weatherData!.weather_state_name == 'Light Rain'){
  return Colors.cyan;
}
  }
}



