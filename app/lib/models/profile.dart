// ignore_for_file: invalid_annotation_target

import 'package:app/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:app/models/tweet.dart';

part 'profile.g.dart';
part 'profile.freezed.dart';

@Freezed()
class Profile with _$Profile {
  @JsonSerializable(explicitToJson: true)
  factory Profile({
    required String name,
    required String bio,
    String? cover,
    required String email,
    String? image,
    required String joinAt,
    required ProfileUser user,
  }) = _Profile;

  factory Profile.fromCurrentUser(Profile profile, User user) =>
      profile.copyWith(
        user: profile.user.copyWith(
          tweet: profile.user.tweet
              .map((e) => e.fromCurrentUser(user))
              .toList(growable: false),
        ),
      );

  factory Profile.fromJsonNonUser({
    required Map<String, dynamic> json,
    required User user,
  }) {
    final profile = ProfileNonUser.fromJson(json);
    final profileUser = ProfileUserNonUser.fromJson(json['user']);

    return Profile(
      name: profile.name,
      bio: profile.bio,
      cover: profile.cover,
      email: profile.email,
      image: profile.image,
      joinAt: profile.joinAt,
      user: profileUser.withCurrentProfile(user),
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@JsonSerializable()
class ProfileNonUser {
  final String name;
  final String bio;
  final String? cover;
  final String email;
  final String? image;
  final String joinAt;

  const ProfileNonUser({
    required this.name,
    required this.bio,
    this.cover,
    required this.email,
    this.image,
    required this.joinAt,
  });

  factory ProfileNonUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileNonUserFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileNonUserToJson(this);
}

@Freezed()
class ProfileUser with _$ProfileUser {
  @JsonSerializable(explicitToJson: true)
  factory ProfileUser({
    @Default([]) List<Tweet> tweet,
    @JsonKey(name: '_count') required ProfileUserCount count,
  }) = _ProfileUser;

  factory ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserFromJson(json);
}

@JsonSerializable()
class ProfileUserNonUser {
  @JsonKey(name: '_count')
  final ProfileUserCount count;
  final List<TweetNonAuthor> tweet;

  const ProfileUserNonUser({
    required this.count,
    required this.tweet,
  });

  withCurrentProfile(User user) => ProfileUser(
        tweet:
            tweet.map((e) => e.fromCurrentUser(user)).toList(growable: false),
        count: count,
      );

  factory ProfileUserNonUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserNonUserFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserNonUserToJson(this);
}

@JsonSerializable()
class ProfileUserCount {
  final int tweet;
  final int followedBy;
  final int following;

  const ProfileUserCount({
    required this.tweet,
    required this.followedBy,
    required this.following,
  });

  factory ProfileUserCount.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserCountFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserCountToJson(this);
}
