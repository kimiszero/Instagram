import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/api/unsplash_api.dart';
import 'package:flutter_instagram/models/feed_model.dart';
import 'package:flutter_instagram/widgets/feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FeedModel> _feedModels = [];
  // loading 중인지 아닌지를 기록하는 변수

  // 현재 page
  int _page = 1;

  bool _isLoading = false;
  // scroll controller
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 페이지가 시작될 때 feedModel 불러오도록 호출
    fetchFeedModels(_page);

    _scrollController.addListener(() {
      final maxHeight = _scrollController.position.maxScrollExtent;
      final height = _scrollController.position.pixels;
      if (height >= maxHeight * 0.8 && !_isLoading) {
        fetchFeedModels(++_page);
      }
    });
  }

  // feedModel 불러오기 함수
  void fetchFeedModels(int page) async {
    setState(() => _isLoading = true);
    final feedModels = await UnsplashAPI.getFeedModels(page: page);
    if (feedModels != null) {
      // success
      print('fetch feed models : page = $page, total = ${feedModels.length}');
      setState(() => _feedModels.addAll(feedModels));
    }

    Future.delayed(
        Duration(milliseconds: 300), () => setState(() => _isLoading = false));
  }

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
            onPressed: () async {
              final feedModels = await UnsplashAPI.getFeedModels();
              if (feedModels != null) {
                print(feedModels[0].likes);
              }
            },
            icon: Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Feed(feedModel: _feedModels[index]);
            },
          ),
          if (_isLoading)
            Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
