import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:weather_app/screens/loading_screen.dart';

// void main() {
Future<void> main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => const Scaffold(
        body: Center(
          child: Text(
            "Something Went Wrong.",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(800, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1700, name: "XL"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoadingScreen(),
    );
  }
}
