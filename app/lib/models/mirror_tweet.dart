import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mirror_tweet.g.dart';

@JsonSerializable()
class MirrorTweet {
  final int id;
  final String? content;
  final String createdAt;
  final int authorId;
  final List<String>? images;
  final int? retweetId;

  const MirrorTweet({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.authorId,
    required this.images,
    required this.retweetId,
  });

  factory MirrorTweet.fromJson(Map<String, dynamic> json) =>
      _$MirrorTweetFromJson(json);

  Map<String, dynamic> toJson() => _$MirrorTweetToJson(this);
}
