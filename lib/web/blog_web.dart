import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components.dart';
import '../res/globals.dart';

class BlogWeb extends StatefulWidget {
  const BlogWeb({super.key});

  @override
  State<BlogWeb> createState() => _BlogWebState();
}

class _BlogWebState extends State<BlogWeb> {
  List title = ["Who is Dash?", "Who is Dash 1?"];
  List body = ["Whell, we can all read about it in Google", "Google it."];

  void article() async {
    await FirebaseFirestore.instance.collection('articles').get().then(
      (querySnapshot) {
        querySnapshot.docs.reversed.forEach((doc) {
          print(doc.data()["title"]);
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    article();
    super.initState();
  }

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
    );
  }
}
