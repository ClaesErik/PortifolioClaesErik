import 'package:claes_erik/mobile/landing_page_mobile.dart';
import 'package:claes_erik/responsiveLayout.dart';
import 'package:claes_erik/web/landing_page_web.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResponsiveLayoutBuilder(
              mobile: LandingPageMobile(), web: LandingPageWeb()),
        );
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResponsiveLayoutBuilder(
              mobile: LandingPageMobile(), web: LandingPageWeb()),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResponsiveLayoutBuilder(
              mobile: LandingPageMobile(), web: LandingPageWeb()),
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResponsiveLayoutBuilder(
              mobile: LandingPageMobile(), web: LandingPageWeb()),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResponsiveLayoutBuilder(
              mobile: LandingPageMobile(), web: LandingPageWeb()),
        );
    }
  }
}
