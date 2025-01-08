import 'package:flutter/material.dart';

import '../components.dart';
import '../res/globals.dart';

class BlogWeb extends StatefulWidget {
  const BlogWeb({super.key});

  @override
  State<BlogWeb> createState() => _BlogWebState();
}

class _BlogWebState extends State<BlogWeb> {
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
              iconTheme: IconThemeData(
                size: 25.0,
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 7.0),
                  child: AbelCustom(
                    text: "Welcome to my blog",
                    size: 30.0,
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
            )
          ];
        },
        body: ListView(
          children: [
            BlogPost(),
            BlogPost(),
            BlogPost(),
            BlogPost(),
          ],
        ),
      ),
    );
  }
}
