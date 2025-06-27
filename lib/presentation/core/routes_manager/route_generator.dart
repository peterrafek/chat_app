 import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/routes_manager/routes.dart';
import 'package:flutter_task/presentation/features/chat_screen/chat_screen.dart';
import 'package:flutter_task/presentation/features/contact_us_screen/contact_us_creen.dart';
import 'package:flutter_task/presentation/features/customer_service_screen/CustomerServiceScreen.dart';
import 'package:flutter_task/presentation/features/help_screen/help_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.customerServiceScreenRoute:
        return MaterialPageRoute(builder: (_) => const CustomerServiceScreen());
      case Routes.helpScreenRoute:
        return MaterialPageRoute(builder: (_) =>   HelpScreen());

      case Routes.contactUsScreenRoute:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());

      case Routes.chatScreenRoute:
        return MaterialPageRoute(builder: (_) =>   ChatScreen());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
