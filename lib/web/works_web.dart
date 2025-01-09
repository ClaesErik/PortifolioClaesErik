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
    var widthDevice = MediaQuery.of(context).size.width;
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
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, bottom: 30.0, top: 30.0),
                child: Column(
                  children: [
                    SansBold("Works", 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedCard(
                            imagePath: "assets/portfolio_claes_screenshot.png",
                            height: 200.0,
                            width: 300.0,
                            accentColor: Globals.accentColor),
                        SizedBox(
                          width: widthDevice / 3,
                          child: Column(
                            children: [
                              SansBold("Portfolio", 30.0),
                              SizedBox(height: 15.0),
                              Sans(
                                  "Deployed on Android, IOS and WEB, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and firebase for the back-end.",
                                  15.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
