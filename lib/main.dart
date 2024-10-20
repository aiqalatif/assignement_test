import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_flutter/reposnive_layout.dart';
import 'package:ui_flutter/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/view/tablet_view.dart';
import 'package:ui_flutter/services/api_services.dart';



Future<void> main() async {
 

  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in, unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App', // Change title to something meaningful
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: ResponsiveLayout(
            mobile: HomePage(),
            tablet: TabletView(),
          ),
        );
      },
      child: const SizedBox.shrink(), // Child widget can be adjusted accordingly
    );
  }
}
