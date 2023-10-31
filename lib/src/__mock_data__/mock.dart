import 'package:tiktok_clone/src/models/user.dart';
import 'package:tiktok_clone/src/models/video.dart';

User currentUser = User(
  username: 'mixin27',
  profileImageUrl: 'assets/images/man.png',
);

User user1 = User(
  username: 'user1',
  profileImageUrl: 'assets/images/man.png',
);
User user2 = User(
  username: 'user2',
  profileImageUrl: 'assets/images/man.png',
);
User user3 = User(
  username: 'user3',
  profileImageUrl: 'assets/images/man.png',
);
User user4 = User(
  username: 'user4',
  profileImageUrl: 'assets/images/man.png',
);
User user5 = User(
  username: 'user5',
  profileImageUrl: 'assets/images/man.png',
);

final List<Video> videos = [
  Video(
    url: 'v1.mp4',
    postedBy: user1,
    caption: 'caption',
    audioName: 'audioName',
    likes: '12.5k',
    comments: '23',
  ),
  Video(
    url: 'v2.mp4',
    postedBy: user2,
    caption: 'caption',
    audioName: 'audioName',
    likes: '12.5k',
    comments: '23',
  ),
  Video(
    url: 'v1.mp4',
    postedBy: user3,
    caption: 'caption',
    audioName: 'audioName',
    likes: '12.5k',
    comments: '23',
  ),
  Video(
    url: 'v2.mp4',
    postedBy: user4,
    caption: 'caption',
    audioName: 'audioName',
    likes: '12.5k',
    comments: '23',
  ),
];
