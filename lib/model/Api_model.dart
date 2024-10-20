
class WeatherModel {
  final String cityName;
  final double temperature;
  final String weatherCondition;
  final String weatherDescription;
  final String weatherIcon;
  final double? humidity; 
  final double? windSpeed; 

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.weatherDescription,
    required this.weatherIcon,
    this.humidity, 
    this.windSpeed, 
  });
}