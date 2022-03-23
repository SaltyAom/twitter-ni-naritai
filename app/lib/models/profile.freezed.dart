// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
class _$ProfileTearOff {
  const _$ProfileTearOff();

  _Profile call(
      {required String name,
      required String bio,
      String? cover,
      required String email,
      String? image,
      required String joinAt,
      required ProfileUser user}) {
    return _Profile(
      name: name,
      bio: bio,
      cover: cover,
      email: email,
      image: image,
      joinAt: joinAt,
      user: user,
    );
  }

  Profile fromJson(Map<String, Object?> json) {
    return Profile.fromJson(json);
  }
}

/// @nodoc
const $Profile = _$ProfileTearOff();

/// @nodoc
mixin _$Profile {
  String get name => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get joinAt => throw _privateConstructorUsedError;
  ProfileUser get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String bio,
      String? cover,
      String email,
      String? image,
      String joinAt,
      ProfileUser user});

  $ProfileUserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? bio = freezed,
    Object? cover = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? joinAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      joinAt: joinAt == freezed
          ? _value.joinAt
          : joinAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfileUser,
    ));
  }

  @override
  $ProfileUserCopyWith<$Res> get user {
    return $ProfileUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String bio,
      String? cover,
      String email,
      String? image,
      String joinAt,
      ProfileUser user});

  @override
  $ProfileUserCopyWith<$Res> get user;
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object? name = freezed,
    Object? bio = freezed,
    Object? cover = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? joinAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_Profile(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      joinAt: joinAt == freezed
          ? _value.joinAt
          : joinAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfileUser,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Profile implements _Profile {
  _$_Profile(
      {required this.name,
      required this.bio,
      this.cover,
      required this.email,
      this.image,
      required this.joinAt,
      required this.user});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final String name;
  @override
  final String bio;
  @override
  final String? cover;
  @override
  final String email;
  @override
  final String? image;
  @override
  final String joinAt;
  @override
  final ProfileUser user;

  @override
  String toString() {
    return 'Profile(name: $name, bio: $bio, cover: $cover, email: $email, image: $image, joinAt: $joinAt, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.bio, bio) &&
            const DeepCollectionEquality().equals(other.cover, cover) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.joinAt, joinAt) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(bio),
      const DeepCollectionEquality().hash(cover),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(joinAt),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(this);
  }
}

abstract class _Profile implements Profile {
  factory _Profile(
      {required String name,
      required String bio,
      String? cover,
      required String email,
      String? image,
      required String joinAt,
      required ProfileUser user}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String get name;
  @override
  String get bio;
  @override
  String? get cover;
  @override
  String get email;
  @override
  String? get image;
  @override
  String get joinAt;
  @override
  ProfileUser get user;
  @override
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) {
  return _ProfileUser.fromJson(json);
}

/// @nodoc
class _$ProfileUserTearOff {
  const _$ProfileUserTearOff();

  _ProfileUser call(
      {List<Tweet> tweet = const [],
      @JsonKey(name: '_count') required ProfileUserCount count}) {
    return _ProfileUser(
      tweet: tweet,
      count: count,
    );
  }

  ProfileUser fromJson(Map<String, Object?> json) {
    return ProfileUser.fromJson(json);
  }
}

/// @nodoc
const $ProfileUser = _$ProfileUserTearOff();

/// @nodoc
mixin _$ProfileUser {
  List<Tweet> get tweet => throw _privateConstructorUsedError;
  @JsonKey(name: '_count')
  ProfileUserCount get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileUserCopyWith<ProfileUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUserCopyWith<$Res> {
  factory $ProfileUserCopyWith(
          ProfileUser value, $Res Function(ProfileUser) then) =
      _$ProfileUserCopyWithImpl<$Res>;
  $Res call(
      {List<Tweet> tweet, @JsonKey(name: '_count') ProfileUserCount count});
}

/// @nodoc
class _$ProfileUserCopyWithImpl<$Res> implements $ProfileUserCopyWith<$Res> {
  _$ProfileUserCopyWithImpl(this._value, this._then);

  final ProfileUser _value;
  // ignore: unused_field
  final $Res Function(ProfileUser) _then;

  @override
  $Res call({
    Object? tweet = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      tweet: tweet == freezed
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as List<Tweet>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as ProfileUserCount,
    ));
  }
}

/// @nodoc
abstract class _$ProfileUserCopyWith<$Res>
    implements $ProfileUserCopyWith<$Res> {
  factory _$ProfileUserCopyWith(
          _ProfileUser value, $Res Function(_ProfileUser) then) =
      __$ProfileUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Tweet> tweet, @JsonKey(name: '_count') ProfileUserCount count});
}

/// @nodoc
class __$ProfileUserCopyWithImpl<$Res> extends _$ProfileUserCopyWithImpl<$Res>
    implements _$ProfileUserCopyWith<$Res> {
  __$ProfileUserCopyWithImpl(
      _ProfileUser _value, $Res Function(_ProfileUser) _then)
      : super(_value, (v) => _then(v as _ProfileUser));

  @override
  _ProfileUser get _value => super._value as _ProfileUser;

  @override
  $Res call({
    Object? tweet = freezed,
    Object? count = freezed,
  }) {
    return _then(_ProfileUser(
      tweet: tweet == freezed
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as List<Tweet>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as ProfileUserCount,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ProfileUser implements _ProfileUser {
  _$_ProfileUser(
      {this.tweet = const [], @JsonKey(name: '_count') required this.count});

  factory _$_ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileUserFromJson(json);

  @JsonKey()
  @override
  final List<Tweet> tweet;
  @override
  @JsonKey(name: '_count')
  final ProfileUserCount count;

  @override
  String toString() {
    return 'ProfileUser(tweet: $tweet, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileUser &&
            const DeepCollectionEquality().equals(other.tweet, tweet) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tweet),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$ProfileUserCopyWith<_ProfileUser> get copyWith =>
      __$ProfileUserCopyWithImpl<_ProfileUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileUserToJson(this);
  }
}

abstract class _ProfileUser implements ProfileUser {
  factory _ProfileUser(
          {List<Tweet> tweet,
          @JsonKey(name: '_count') required ProfileUserCount count}) =
      _$_ProfileUser;

  factory _ProfileUser.fromJson(Map<String, dynamic> json) =
      _$_ProfileUser.fromJson;

  @override
  List<Tweet> get tweet;
  @override
  @JsonKey(name: '_count')
  ProfileUserCount get count;
  @override
  @JsonKey(ignore: true)
  _$ProfileUserCopyWith<_ProfileUser> get copyWith =>
      throw _privateConstructorUsedError;
}
