import 'package:flutter/material.dart';

import '../components.dart';
import '../res/globals.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WebDrawer(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 650.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/works.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  TabsWeb(
                      title: "Home",
                      accentColor: Globals.accentColor,
                      route: '/'),
                  Spacer(),
                  TabsWeb(
                      title: "Works",
                      accentColor: Globals.accentColor,
                      route: '/works'),
                  Spacer(),
                  TabsWeb(
                      title: "Blog",
                      accentColor: Globals.accentColor,
                      route: '/blog'),
                  Spacer(),
                  TabsWeb(
                      title: "About",
                      accentColor: Globals.accentColor,
                      route: '/about'),
                  Spacer(),
                  TabsWeb(
                      title: "Contact",
                      accentColor: Globals.accentColor,
                      route: '/contact'),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: ListView(),
      ),
    );
  }
}
