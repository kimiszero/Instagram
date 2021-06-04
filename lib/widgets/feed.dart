import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/feed_model.dart';
import 'package:intl/intl.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.feedModel,
  }) : super(key: key);

  final FeedModel feedModel;

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.network(
            widget.feedModel.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  widget.feedModel.likedByUser = !widget.feedModel.likedByUser;
                  if (widget.feedModel.likedByUser) {
                    widget.feedModel.likes += 1;
                  } else {
                    widget.feedModel.likes -= 1;
                  }
                });
              },
              icon: Icon(CupertinoIcons.heart),
              color: widget.feedModel.likedByUser
                  ? Colors.pinkAccent
                  : Colors.black,
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.feedModel.likes} likes',
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
                      text: widget.feedModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '${widget.feedModel.description}',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${DateFormat('MMMM dd').format(widget.feedModel.createdAt)}',
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
