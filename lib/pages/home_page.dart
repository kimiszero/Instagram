import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/widgets/feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Feed();
          },
        ));
  }
}
