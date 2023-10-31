import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/src/models/video.dart';

class HomeSidebar extends StatefulWidget {
  const HomeSidebar({super.key, required this.video});

  final Video video;

  @override
  State<HomeSidebar> createState() => _HomeSidebarState();
}

class _HomeSidebarState extends State<HomeSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontSize: 13, color: Colors.white);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(widget.video.postedBy.profileImageUrl),
          _sidebarItem(Icons.favorite, widget.video.likes, style),
          _sidebarItem(Icons.comment, widget.video.comments, style),
          _sidebarItem(Icons.share, 'Share', style),
          AnimatedBuilder(
            animation: _animationController,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/images/music-disc-with-white-details.png',
                  ),
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(
                    widget.video.postedBy.profileImageUrl,
                  ),
                ),
              ],
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: 2 * pi * _animationController.value,
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }

  _sidebarItem(IconData icon, String label, TextStyle style) {
    return Column(
      children: [
        Icon(
          icon,
          size: 35,
          color: Colors.white.withOpacity(0.7),
        ),
        const SizedBox(height: 5),
        Text(label, style: style),
      ],
    );
  }

  _profileImageButton(String profileUrl) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(profileUrl),
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: const Icon(Icons.add, size: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
