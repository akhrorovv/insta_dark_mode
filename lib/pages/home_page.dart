import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insta_dark_mode/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  final _pages = const [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Instagram',
          style:
              TextStyle(fontFamily: 'Jost', color: Colors.grey, fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(
            FeatherIcons.camera,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.tvOutline,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.send,
              color: Colors.grey,
            ),
          ),
        ],
      ),

      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentPage,
        onTap: (i){
          setState((){
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.plusSquare),
              label: 'Add tool'
          ),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.heart),
              label: 'Actions'
          ),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user),
              label: 'Account'
          ),
        ],
      ),
    );
  }
}
