import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/camera_page.dart';
import 'package:flutter_instagram/pages/favorite_page.dart';
import 'package:flutter_instagram/pages/home_page.dart';
import 'package:flutter_instagram/pages/my_page.dart';
import 'package:flutter_instagram/pages/search_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomePage(),
          SearchPage(),
          Container(),
          FavoritePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraPage()),
            );
          } else {
            return setState(() => selectedIndex = index);
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.camera), label: 'camera'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'person'),
        ],
      ),
    );
  }
}
