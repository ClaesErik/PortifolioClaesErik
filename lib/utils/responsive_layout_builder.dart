import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  const ResponsiveLayoutBuilder(
      {super.key, required this.mobile, required this.web});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 800;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width > 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isWeb(context)) {
          return web;
        } else {
          return mobile;
        }
      },
    );
  }
}
