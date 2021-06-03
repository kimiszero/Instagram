import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/create_page.dart';
import 'package:flutter_instagram/pages/my_page_detail.dart';
import 'package:flutter_instagram/widgets/statistics.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<String> dummyUrls = [
    'https://images.unsplash.com/photo-1594000033503-51ac2b9adf7b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjIwNjMzMDg5&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
    'https://images.unsplash.com/photo-1599277062739-e1878f97c79a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjIwNjMzMDg0&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
    'https://images.unsplash.com/photo-1618826600407-504c12fe83a4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1618130087539-48980a31d2cd?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619958405058-7acc496227db?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619590495690-c6e26ee899ff?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619843010095-9933770bd91d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619233450241-e3b85ff1547d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.lock,
            color: Colors.black,
          ),
        ),
        title: Text(
          'zerome',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreatePage()));
            },
            icon: Icon(
              CupertinoIcons.plus_app,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.square_arrow_right,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/cat.jpeg'),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.bottomRight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 28,
                                  height: 28,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Statistic(count: '30', title: '게시물'),
                      ),
                      Expanded(
                        child: Statistic(count: '1', title: '팔로워'),
                      ),
                      Expanded(
                        child: Statistic(count: '1', title: '팔로잉'),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('zerome'),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(30, (index) {
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Image.network(
                        dummyUrls[index % dummyUrls.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPageDetail(), // WritingPage로 이동
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
