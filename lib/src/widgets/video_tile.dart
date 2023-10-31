import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok_clone/src/models/video.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({
    super.key,
    required this.video,
    required this.snappedPageIndex,
    required this.currentIndex,
  });

  final Video video;
  final int snappedPageIndex;
  final int currentIndex;

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _videoPlayerController;
  late Future _initializeVideoPlayer;

  bool _isVideoPlaying = true;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(
      'assets/raw/${widget.video.url}',
    );
    _initializeVideoPlayer = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _pausePlayVideo() {
    _isVideoPlaying
        ? _videoPlayerController.pause()
        : _videoPlayerController.play();

    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    (widget.snappedPageIndex == widget.currentIndex && _isVideoPlaying)
        ? _videoPlayerController.play()
        : _videoPlayerController.pause();

    return Container(
      color: Colors.black,
      child: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: _pausePlayVideo,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_videoPlayerController),
                  if (!_isVideoPlaying)
                    IconButton(
                      onPressed: _pausePlayVideo,
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white.withOpacity(0.5),
                        size: 60,
                      ),
                    ),
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/tiktok-loader.json',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}
