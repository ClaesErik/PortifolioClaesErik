import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../globals.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
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
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                size: 35.0,
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: AbelCustom(
                    text: "Welcome to my blog",
                    size: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Image.asset(
                  "assets/blog.jpg",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: 400.0,
            )
          ];
        },
        body: ListView(),
      ),
    ));
  }
}
