// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetNonAuthor _$TweetNonAuthorFromJson(Map<String, dynamic> json) =>
    TweetNonAuthor(
      id: json['id'] as int,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      retweetFrom: json['retweetFrom'] == null
          ? null
          : TweetFrom.fromJson(json['retweetFrom'] as Map<String, dynamic>),
      count: TweetCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TweetNonAuthorToJson(TweetNonAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'images': instance.images,
      'retweetFrom': instance.retweetFrom,
      '_count': instance.count,
    };

TweetFrom _$TweetFromFromJson(Map<String, dynamic> json) => TweetFrom(
      id: json['id'] as int,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String,
      authorId: json['authorId'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      retweetId: json['retweetId'] as int?,
      author: TweetAuthor.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TweetFromToJson(TweetFrom instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'authorId': instance.authorId,
      'images': instance.images,
      'retweetId': instance.retweetId,
      'author': instance.author,
    };

TweetAuthor _$TweetAuthorFromJson(Map<String, dynamic> json) => TweetAuthor(
      profile:
          TweetAuthorProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TweetAuthorToJson(TweetAuthor instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

TweetAuthorProfile _$TweetAuthorProfileFromJson(Map<String, dynamic> json) =>
    TweetAuthorProfile(
      alias: json['alias'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$TweetAuthorProfileToJson(TweetAuthorProfile instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'name': instance.name,
      'image': instance.image,
    };

TweetCount _$TweetCountFromJson(Map<String, dynamic> json) => TweetCount(
      favoriteBy: json['favoriteBy'] as int,
      retweet: json['retweet'] as int,
    );

Map<String, dynamic> _$TweetCountToJson(TweetCount instance) =>
    <String, dynamic>{
      'favoriteBy': instance.favoriteBy,
      'retweet': instance.retweet,
    };

_$_Tweet _$$_TweetFromJson(Map<String, dynamic> json) => _$_Tweet(
      id: json['id'] as int,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      retweetFrom: json['retweetFrom'] == null
          ? null
          : TweetFrom.fromJson(json['retweetFrom'] as Map<String, dynamic>),
      author: TweetAuthor.fromJson(json['author'] as Map<String, dynamic>),
      count: TweetCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TweetToJson(_$_Tweet instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'images': instance.images,
      'retweetFrom': instance.retweetFrom?.toJson(),
      'author': instance.author.toJson(),
      '_count': instance.count.toJson(),
    };
