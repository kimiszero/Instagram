import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.asset(
            'assets/images/cat.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.heart),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.chat_bubble),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.paperplane),
              color: Colors.black,
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.bookmark),
              color: Colors.black,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '9 likes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'zerome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "   I don't play the game"),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'MAY 31',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
