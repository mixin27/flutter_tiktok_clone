import 'dart:convert';

class User {
  User({
    required this.username,
    required this.profileImageUrl,
  });

  final String username;
  final String profileImageUrl;

  User copyWith({
    String? username,
    String? profileImageUrl,
  }) {
    return User(
      username: username ?? this.username,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      profileImageUrl: map['profileImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(username: $username, profileImageUrl: $profileImageUrl)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.profileImageUrl == profileImageUrl;
  }

  @override
  int get hashCode => username.hashCode ^ profileImageUrl.hashCode;
}
