// ignore_for_file: invalid_annotation_target

import 'package:app/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet.g.dart';
part 'tweet.freezed.dart';

@Freezed()
class Tweet with _$Tweet {
  @JsonSerializable(explicitToJson: true)
  factory Tweet({
    required int id,
    String? content,
    required String createdAt,
    @Default([]) List<String> images,
    TweetFrom? retweetFrom,
    required TweetAuthor author,
    @JsonKey(name: '_count') required TweetCount count,
  }) = _Tweet;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}

extension TweetTransform on Tweet {
  Tweet fromCurrentUser(User user) => copyWith(
        author: TweetAuthor.fromCurrentUser(user),
      );
}

@JsonSerializable()
class TweetNonAuthor {
  final int id;
  final String? content;
  final String createdAt;
  final List<String> images;
  final TweetFrom? retweetFrom;
  @JsonKey(name: '_count')
  final TweetCount count;

  const TweetNonAuthor({
    required this.id,
    this.content,
    required this.createdAt,
    required this.images,
    required this.retweetFrom,
    required this.count,
  });

  Tweet fromCurrentUser(User user) => Tweet(
        id: id,
        content: content,
        createdAt: createdAt,
        images: images,
        retweetFrom: retweetFrom,
        author: TweetAuthor.fromCurrentUser(user),
        count: count,
      );

  factory TweetNonAuthor.fromJson(Map<String, dynamic> json) =>
      _$TweetNonAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$TweetNonAuthorToJson(this);
}

@JsonSerializable()
class TweetFrom {
  final int id;
  final String? content;
  final String createdAt;
  final int authorId;
  final List<String> images;
  final int? retweetId;
  final TweetAuthor author;

  const TweetFrom({
    required this.id,
    this.content,
    required this.createdAt,
    required this.authorId,
    required this.images,
    this.retweetId,
    required this.author,
  });

  factory TweetFrom.fromJson(Map<String, dynamic> json) =>
      _$TweetFromFromJson(json);

  Map<String, dynamic> toJson() => _$TweetFromToJson(this);
}

@JsonSerializable()
class TweetAuthor {
  final TweetAuthorProfile profile;

  const TweetAuthor({
    required this.profile,
  });

  factory TweetAuthor.fromCurrentUser(User user) => TweetAuthor(
        profile: TweetAuthorProfile.fromCurrentUser(user),
      );

  factory TweetAuthor.fromJson(Map<String, dynamic> json) =>
      _$TweetAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$TweetAuthorToJson(this);
}

@JsonSerializable()
class TweetAuthorProfile {
  final String alias;
  final String name;
  final String? image;

  const TweetAuthorProfile({
    required this.alias,
    required this.name,
    this.image,
  });

  factory TweetAuthorProfile.fromCurrentUser(User user) => TweetAuthorProfile(
        alias: user.alias,
        name: user.name,
        image: user.image,
      );

  factory TweetAuthorProfile.fromJson(Map<String, dynamic> json) =>
      _$TweetAuthorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$TweetAuthorProfileToJson(this);
}

@JsonSerializable()
class TweetCount {
  final int favoriteBy;
  final int retweet;

  const TweetCount({
    required this.favoriteBy,
    required this.retweet,
  });

  factory TweetCount.fromJson(Map<String, dynamic> json) =>
      _$TweetCountFromJson(json);

  Map<String, dynamic> toJson() => _$TweetCountToJson(this);
}
