import 'package:flutter/material.dart';
import 'package:ui_flutter/model/api_model.dart'; // Adjust this import to your API model location

class WeatherInfoWidget extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfoWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Use SingleChildScrollView to prevent overflow
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  weather.cityName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              "${weather.temperature}° C",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,  // Responsive width
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Weather Condition: ${weather.weatherCondition}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Humidity: ${weather.humidity?.toStringAsFixed(1) ?? 'N/A'}%",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Wind Speed: ${weather.windSpeed?.toStringAsFixed(1) ?? 'N/A'} m/s",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
