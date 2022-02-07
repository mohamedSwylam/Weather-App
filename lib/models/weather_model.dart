class WeatherModel {
  final String ?weather_state_name;
  final DateTime ?date;
  final double ?the_temp;

  final double ?min_temp;
  final double ?max_temp;

  WeatherModel(
      {this.weather_state_name, this.date, this.the_temp, this.min_temp, this.max_temp});

  factory WeatherModel.fromjson(Map<String, dynamic>json){
    return WeatherModel(
        weather_state_name: json['weather_state_name'],
        date: DateTime.parse(json['created']),
        min_temp: json['min_temp'],
    max_temp: json['max_temp'],
    the_temp: json['the_temp'],
    );
  }

}