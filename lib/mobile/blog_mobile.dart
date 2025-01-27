import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../res/globals.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  // List title = ["Who is Dash?", "Who is Dash 1?"];
  // List body = ["Well, we can all read about it in Google", "Google it."];

  // void article() async {
  //   await FirebaseFirestore.instance.collection('articles').get().then(
  //     (querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //         print(doc.data()["title"]);
  //       });
  //     },
  //     onError: (e) => print("Error completing: $e"),
  //   );
  // }
  //
  // void streamArticle() async {
  //   var logger = Logger();
  //   await for (var snapshot
  //       in FirebaseFirestore.instance.collection('articles').snapshots()) {
  //     for (var title in snapshot.docs) {
  //       logger.d(title.data()['title']);
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   // article();
  //   streamArticle();
  //   super.initState();
  // }

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
          body: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('articles').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return BlogPost(
                            title: documentSnapshot['title'],
                            body: documentSnapshot['body']);
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
