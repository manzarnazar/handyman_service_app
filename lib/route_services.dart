import 'package:booking_system_flutter/screens/service/service_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      // case '/homepage':
      //   return CupertinoPageRoute(builder: (_) {
      //     return const HomeScreen();
      //   });

      case "/serviceDetails":
        if (args is Map) {
          return CupertinoPageRoute(builder: (_) {
            return ServiceDetailScreen(
              serviceId: 30,
            );
          });
        } else {
          return _errorRoute();
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found"),
        ),
      );
    });
  }
}
