import 'package:claes_erik/mobile/landing_page_mobile.dart';
import 'package:claes_erik/web/landing_page_web.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            return constraints.maxWidth > 800
                ? LandingPageWeb()
                : LandingPageMobile();
          }),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            return constraints.maxWidth > 800
                ? LandingPageWeb()
                : LandingPageMobile();
          }),
        );
    }
  }
}
