import 'package:claes_erik/mobile/about_mobile.dart';
import 'package:claes_erik/mobile/contact_mobile.dart';
import 'package:claes_erik/mobile/landing_page_mobile.dart';
import 'package:claes_erik/web/about_web.dart';
import 'package:claes_erik/web/contact_web.dart';
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
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            return constraints.maxWidth > 800 ? ContactWeb() : ContactMobile();
          }),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            return constraints.maxWidth > 800 ? AboutWeb() : AboutMobile();
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
