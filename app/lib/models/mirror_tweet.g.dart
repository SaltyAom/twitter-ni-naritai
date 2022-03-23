// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mirror_tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MirrorTweet _$MirrorTweetFromJson(Map<String, dynamic> json) => MirrorTweet(
      id: json['id'] as int,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String,
      authorId: json['authorId'] as int,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      retweetId: json['retweetId'] as int?,
    );

Map<String, dynamic> _$MirrorTweetToJson(MirrorTweet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'authorId': instance.authorId,
      'images': instance.images,
      'retweetId': instance.retweetId,
    };
