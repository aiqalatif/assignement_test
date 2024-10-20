import 'package:flutter/material.dart';

 // Adjust the import as needed
// Adjust the import to your WeatherInfoWidget location



import 'package:provider/provider.dart';
import 'package:ui_flutter/view/weight/custom_app_br.dart';
import 'package:ui_flutter/view/weight/custom_container.dart';
import 'package:ui_flutter/view/weight/search_br.dart';import 'package:ui_flutter/services/api_services.dart';class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: CustomAppBr(
            title: 'Weather App',
            temperature: weatherProvider.weather?.humidity.toString() ?? 'N/A',
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/imagee.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                 // Inside the HomePage class

CustomInput(
  controller: _cityController,
  hintText: 'Enter City Name',
  onPressed: () {
    if (_cityController.text.isNotEmpty) {
      context.read<WeatherProvider>().fetchWeather(_cityController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Please enter a city name.')),
      );
    }
  },
),

                    const SizedBox(height: 60),
                    Consumer<WeatherProvider>(builder: (context, weatherProvider, child) {
                      if (weatherProvider.isLoading) {
                        return const Center(child: CircularProgressIndicator(color: Colors.white));
                      }

                      if (weatherProvider.weather != null) {
                        return WeatherInfoWidget(weather: weatherProvider.weather!);
                      }

                      return const Text(
                        "Enter a city name to get the weather info.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
