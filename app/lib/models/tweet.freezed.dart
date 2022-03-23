// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tweet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return _Tweet.fromJson(json);
}

/// @nodoc
class _$TweetTearOff {
  const _$TweetTearOff();

  _Tweet call(
      {required int id,
      String? content,
      required String createdAt,
      List<String> images = const [],
      TweetFrom? retweetFrom,
      required TweetAuthor author,
      @JsonKey(name: '_count') required TweetCount count}) {
    return _Tweet(
      id: id,
      content: content,
      createdAt: createdAt,
      images: images,
      retweetFrom: retweetFrom,
      author: author,
      count: count,
    );
  }

  Tweet fromJson(Map<String, Object?> json) {
    return Tweet.fromJson(json);
  }
}

/// @nodoc
const $Tweet = _$TweetTearOff();

/// @nodoc
mixin _$Tweet {
  int get id => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  TweetFrom? get retweetFrom => throw _privateConstructorUsedError;
  TweetAuthor get author => throw _privateConstructorUsedError;
  @JsonKey(name: '_count')
  TweetCount get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetCopyWith<Tweet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetCopyWith<$Res> {
  factory $TweetCopyWith(Tweet value, $Res Function(Tweet) then) =
      _$TweetCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? content,
      String createdAt,
      List<String> images,
      TweetFrom? retweetFrom,
      TweetAuthor author,
      @JsonKey(name: '_count') TweetCount count});
}

/// @nodoc
class _$TweetCopyWithImpl<$Res> implements $TweetCopyWith<$Res> {
  _$TweetCopyWithImpl(this._value, this._then);

  final Tweet _value;
  // ignore: unused_field
  final $Res Function(Tweet) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? images = freezed,
    Object? retweetFrom = freezed,
    Object? author = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      retweetFrom: retweetFrom == freezed
          ? _value.retweetFrom
          : retweetFrom // ignore: cast_nullable_to_non_nullable
              as TweetFrom?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as TweetAuthor,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as TweetCount,
    ));
  }
}

/// @nodoc
abstract class _$TweetCopyWith<$Res> implements $TweetCopyWith<$Res> {
  factory _$TweetCopyWith(_Tweet value, $Res Function(_Tweet) then) =
      __$TweetCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? content,
      String createdAt,
      List<String> images,
      TweetFrom? retweetFrom,
      TweetAuthor author,
      @JsonKey(name: '_count') TweetCount count});
}

/// @nodoc
class __$TweetCopyWithImpl<$Res> extends _$TweetCopyWithImpl<$Res>
    implements _$TweetCopyWith<$Res> {
  __$TweetCopyWithImpl(_Tweet _value, $Res Function(_Tweet) _then)
      : super(_value, (v) => _then(v as _Tweet));

  @override
  _Tweet get _value => super._value as _Tweet;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? images = freezed,
    Object? retweetFrom = freezed,
    Object? author = freezed,
    Object? count = freezed,
  }) {
    return _then(_Tweet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      retweetFrom: retweetFrom == freezed
          ? _value.retweetFrom
          : retweetFrom // ignore: cast_nullable_to_non_nullable
              as TweetFrom?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as TweetAuthor,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as TweetCount,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Tweet implements _Tweet {
  _$_Tweet(
      {required this.id,
      this.content,
      required this.createdAt,
      this.images = const [],
      this.retweetFrom,
      required this.author,
      @JsonKey(name: '_count') required this.count});

  factory _$_Tweet.fromJson(Map<String, dynamic> json) =>
      _$$_TweetFromJson(json);

  @override
  final int id;
  @override
  final String? content;
  @override
  final String createdAt;
  @JsonKey()
  @override
  final List<String> images;
  @override
  final TweetFrom? retweetFrom;
  @override
  final TweetAuthor author;
  @override
  @JsonKey(name: '_count')
  final TweetCount count;

  @override
  String toString() {
    return 'Tweet(id: $id, content: $content, createdAt: $createdAt, images: $images, retweetFrom: $retweetFrom, author: $author, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tweet &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality()
                .equals(other.retweetFrom, retweetFrom) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(images),
      const DeepCollectionEquality().hash(retweetFrom),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$TweetCopyWith<_Tweet> get copyWith =>
      __$TweetCopyWithImpl<_Tweet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetToJson(this);
  }
}

abstract class _Tweet implements Tweet {
  factory _Tweet(
      {required int id,
      String? content,
      required String createdAt,
      List<String> images,
      TweetFrom? retweetFrom,
      required TweetAuthor author,
      @JsonKey(name: '_count') required TweetCount count}) = _$_Tweet;

  factory _Tweet.fromJson(Map<String, dynamic> json) = _$_Tweet.fromJson;

  @override
  int get id;
  @override
  String? get content;
  @override
  String get createdAt;
  @override
  List<String> get images;
  @override
  TweetFrom? get retweetFrom;
  @override
  TweetAuthor get author;
  @override
  @JsonKey(name: '_count')
  TweetCount get count;
  @override
  @JsonKey(ignore: true)
  _$TweetCopyWith<_Tweet> get copyWith => throw _privateConstructorUsedError;
}
