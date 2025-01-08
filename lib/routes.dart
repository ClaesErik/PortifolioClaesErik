import 'package:claes_erik/mobile/about_mobile.dart';
import 'package:claes_erik/mobile/blog_mobile.dart';
import 'package:claes_erik/mobile/contact_mobile.dart';
import 'package:claes_erik/mobile/landing_page_mobile.dart';
import 'package:claes_erik/utils/responsive_layout_builder.dart';
import 'package:claes_erik/web/about_web.dart';
import 'package:claes_erik/web/blog_web.dart';
import 'package:claes_erik/web/contact_web.dart';
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
              mobile: ContactMobile(), web: ContactWeb()),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              ResponsiveLayoutBuilder(mobile: AboutMobile(), web: AboutWeb()),
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              ResponsiveLayoutBuilder(mobile: BlogMobile(), web: BlogWeb()),
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
