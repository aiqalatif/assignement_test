import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/view/weight/custom_app_br.dart';
import 'package:ui_flutter/view/weight/custom_container.dart';
import 'package:ui_flutter/view/weight/search_br.dart';
import 'package:ui_flutter/services/api_services.dart'; // Adjust the import as needed

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  final TextEditingController _cityController = TextEditingController();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    // Initialize local notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  // Method to show a notification
  Future<void> _showNotification(String city, double temperature) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'weather_channel', // channel ID
      'Weather Notifications', // channel name
      channelDescription: 'Notifications for temperature warnings',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'High Temperature Alert!', // Notification title
      'The temperature in $city is $temperature°C, which exceeds 30°C!', // Notification body
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: CustomAppBr(
            title: 'Weather App',
            temperature: weatherProvider.weather?.humidity.toString() ?? 'N/A',
          ),
        ),
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/imagee.jpg', 
                fit: BoxFit.cover, 
              ),
            ),
            Row(
              children: [
             
                Container(
                  width: 250,
                  color: Colors.blueGrey[800]?.withOpacity(0.8),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Current Weather', style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Forecast', style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
            
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInput(
                          controller: _cityController,
                          hintText: 'Enter City Name',
                          onPressed: () {
                            if (_cityController.text.isNotEmpty) {
                              context.read<WeatherProvider>().fetchWeather(_cityController.text).then((_) {
                                // Check the temperature and show notification if it's above 30°C
                                final weather = weatherProvider.weather;
                                if (weather != null && weather.temperature > 30) {
                                  _showNotification(weather.cityName, weather.temperature);
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please enter a city name.')),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Consumer<WeatherProvider>(
                            builder: (context, weatherProvider, child) {
                              if (weatherProvider.isLoading) {
                                return const Center(child: CircularProgressIndicator(color: Colors.blue));
                              }

                              if (weatherProvider.weather != null) {
                                return WeatherInfoWidget(weather: weatherProvider.weather!);
                              }

                              return const Center(
                                child: Text(
                                  "Enter a city name to get the weather info.",
                                  style: TextStyle(color: Colors.black54, fontSize: 18),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
