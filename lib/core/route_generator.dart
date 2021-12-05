import 'package:flutter/material.dart';
import 'package:squamobi_test/features/home/screen/home.dart';


const String initialPage = '/';


class RouteRegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );

      default:
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
