import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/widgets/feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.camera,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/logo.png',
            height: 32,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.paperplane,
                color: Colors.black,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Feed();
          },
        ),
      ),
    );
  }
}
