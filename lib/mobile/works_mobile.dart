import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../res/globals.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        endDrawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black),
                  ),
                  child: Image.asset('assets/perfil-circle.png'),
                ),
              ),
              TabsMobile(text: "Home", route: '/'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Works", route: '/works'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Blog", route: '/blog'),
              SizedBox(height: 20.0),
              TabsMobile(text: "About", route: '/about'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Contact", route: '/contact'),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () async =>
                            await launchUrl(Uri.parse(Globals.instaURL)),
                        icon: SvgPicture.asset(
                          Globals.instagramIcon,
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.srcIn),
                          width: 35.0,
                        )),
                    IconButton(
                        onPressed: () async =>
                            await launchUrl(Uri.parse(Globals.githubURL)),
                        icon: SvgPicture.asset(
                          Globals.githubIcon,
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.srcIn),
                          width: 35.0,
                        )),
                    IconButton(
                        onPressed: () async =>
                            await launchUrl(Uri.parse(Globals.linkedinURL)),
                        icon: SvgPicture.asset(
                          Globals.linkedinIcon,
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.srcIn),
                          width: 35.0,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      Image.asset("assets/works.jpg", fit: BoxFit.cover),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  SansBold("Works", 35.0),
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/portfolio_claes_screenshot.png",
                    accentColor: Globals.accentColor,
                    fit: BoxFit.cover,
                    height: 150.0,
                    width: 300.0,
                    paddingAll: 7.0,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("Portfolio", 20.0),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Sans(
                        "Deployed on Android, IOS and WEB, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and firebase for the back-end.",
                        15.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
