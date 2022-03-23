// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileNonUser _$ProfileNonUserFromJson(Map<String, dynamic> json) =>
    ProfileNonUser(
      name: json['name'] as String,
      bio: json['bio'] as String,
      cover: json['cover'] as String?,
      email: json['email'] as String,
      image: json['image'] as String?,
      joinAt: json['joinAt'] as String,
    );

Map<String, dynamic> _$ProfileNonUserToJson(ProfileNonUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'cover': instance.cover,
      'email': instance.email,
      'image': instance.image,
      'joinAt': instance.joinAt,
    };

ProfileUserNonUser _$ProfileUserNonUserFromJson(Map<String, dynamic> json) =>
    ProfileUserNonUser(
      count: ProfileUserCount.fromJson(json['_count'] as Map<String, dynamic>),
      tweet: (json['tweet'] as List<dynamic>)
          .map((e) => TweetNonAuthor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileUserNonUserToJson(ProfileUserNonUser instance) =>
    <String, dynamic>{
      '_count': instance.count,
      'tweet': instance.tweet,
    };

ProfileUserCount _$ProfileUserCountFromJson(Map<String, dynamic> json) =>
    ProfileUserCount(
      tweet: json['tweet'] as int,
      followedBy: json['followedBy'] as int,
      following: json['following'] as int,
    );

Map<String, dynamic> _$ProfileUserCountToJson(ProfileUserCount instance) =>
    <String, dynamic>{
      'tweet': instance.tweet,
      'followedBy': instance.followedBy,
      'following': instance.following,
    };

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      name: json['name'] as String,
      bio: json['bio'] as String,
      cover: json['cover'] as String?,
      email: json['email'] as String,
      image: json['image'] as String?,
      joinAt: json['joinAt'] as String,
      user: ProfileUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'cover': instance.cover,
      'email': instance.email,
      'image': instance.image,
      'joinAt': instance.joinAt,
      'user': instance.user.toJson(),
    };

_$_ProfileUser _$$_ProfileUserFromJson(Map<String, dynamic> json) =>
    _$_ProfileUser(
      tweet: (json['tweet'] as List<dynamic>?)
              ?.map((e) => Tweet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      count: ProfileUserCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProfileUserToJson(_$_ProfileUser instance) =>
    <String, dynamic>{
      'tweet': instance.tweet.map((e) => e.toJson()).toList(),
      '_count': instance.count.toJson(),
    };
