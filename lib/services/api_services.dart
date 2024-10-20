import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:weather/weather.dart';
import 'package:ui_flutter/model/api_model.dart';
import 'package:ui_flutter/view/weight/const.dart';

class WeatherProvider with ChangeNotifier {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  WeatherModel? _weatherModel;
  bool _isLoading = false;

  final WeatherFactory _weatherFactory = WeatherFactory(OPENWEATHER_API_KEY);

  WeatherModel? get weather => _weatherModel;
  bool get isLoading => _isLoading;

  WeatherProvider() {
   
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      Weather weather = await _weatherFactory.currentWeatherByCityName(city);
      
      _weatherModel = WeatherModel(
        cityName: weather.areaName ?? '',
        temperature: weather.temperature?.celsius ?? 0.0,
        weatherCondition: weather.weatherMain ?? '',
        weatherDescription: weather.weatherDescription ?? '',
        weatherIcon: weather.weatherIcon ?? '',
        humidity: weather.humidity ?? 0.0,
        windSpeed: weather.windSpeed ?? 0.0,
      );

      // Show notification if temperature exceeds 30°C
      if (_weatherModel!.temperature > 20) {
        _showNotification(_weatherModel!.cityName, _weatherModel!.temperature);
      }
    } catch (e) {
      print("Error fetching weather: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _showNotification(String city, double temperature) async {
    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print('Showing notification for $city with temperature $temperature');
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'weather_channel', 
      'Weather Notifications', 
      channelDescription: 'Notifications for temperature warnings',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0, 
      'High Temperature Alert!', 
      'The temperature in $city is $temperature°C, which exceeds 20°C!', 
      platformChannelSpecifics,
    );
  }
}
