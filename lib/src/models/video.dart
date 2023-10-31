import 'dart:convert';

import 'package:tiktok_clone/src/models/user.dart';

class Video {
  Video({
    required this.url,
    required this.postedBy,
    required this.caption,
    required this.audioName,
    required this.likes,
    required this.comments,
  });

  final String url;
  final User postedBy;
  final String caption;
  final String audioName;
  final String likes;
  final String comments;

  Video copyWith({
    String? url,
    User? postedBy,
    String? caption,
    String? audioName,
    String? likes,
    String? comments,
  }) {
    return Video(
      url: url ?? this.url,
      postedBy: postedBy ?? this.postedBy,
      caption: caption ?? this.caption,
      audioName: audioName ?? this.audioName,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'postedBy': postedBy.toMap(),
      'caption': caption,
      'audioName': audioName,
      'likes': likes,
      'comments': comments,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      url: map['url'] as String,
      postedBy: User.fromMap(map['postedBy'] as Map<String, dynamic>),
      caption: map['caption'] as String,
      audioName: map['audioName'] as String,
      likes: map['likes'] as String,
      comments: map['comments'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Video(url: $url, postedBy: $postedBy, caption: $caption, audioName: $audioName, likes: $likes, comments: $comments)';
  }

  @override
  bool operator ==(covariant Video other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.postedBy == postedBy &&
        other.caption == caption &&
        other.audioName == audioName &&
        other.likes == likes &&
        other.comments == comments;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        postedBy.hashCode ^
        caption.hashCode ^
        audioName.hashCode ^
        likes.hashCode ^
        comments.hashCode;
  }
}
