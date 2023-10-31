import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/src/__mock_data__/mock.dart';
import 'package:tiktok_clone/src/widgets/video_tile.dart';

import '../widgets/home_sidebar.dart';
import '../widgets/video_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFollowingSelected = false;
  int _snappedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => setState(() => _isFollowingSelected = true),
              child: Text(
                'Following',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: _isFollowingSelected ? 18 : 14,
                      color: _isFollowingSelected ? Colors.white : Colors.grey,
                    ),
              ),
            ),
            Text(
              '    |    ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 14, color: Colors.grey),
            ),
            GestureDetector(
              onTap: () => setState(() => _isFollowingSelected = false),
              child: Text(
                'For You',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: _isFollowingSelected ? 14 : 18,
                      color: _isFollowingSelected ? Colors.grey : Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (page) {
          log('Page change to $page');
          setState(() {
            _snappedPageIndex = page;
          });
        },
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoTile(
                video: videos[index],
                currentIndex: index,
                snappedPageIndex: _snappedPageIndex,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: size.height / 4,
                      child: VideoDetail(video: videos[index]),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height / 1.75,
                      child: HomeSidebar(video: videos[index]),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
