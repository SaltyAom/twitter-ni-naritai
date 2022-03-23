import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class User {
  User({
    required this.username,
    required this.name,
    required this.alias,
    this.image =
        'https://pbs.twimg.com/profile_images/1501586627906338818/0WKZDMPZ_400x400.jpg',
    required this.token,
  });

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String alias;

  @HiveField(4)
  final String image;

  @HiveField(5)
  final String token;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? username,
    String? name,
    String? alias,
    String? image,
    String? token,
  }) =>
      User(
        username: username ?? this.username,
        name: name ?? this.name,
        alias: alias ?? this.alias,
        image: image ??
            (this.image.isNotEmpty
                ? this.image
                : 'https://pbs.twimg.com/profile_images/1501586627906338818/0WKZDMPZ_400x400.jpg'),
        token: token ?? this.token,
      );
}

@HiveType(typeId: 2)
class UserList {
  UserList({
    this.active,
    required this.profiles,
  });

  @HiveField(1)
  final int? active;

  @HiveField(2)
  final List<User> profiles;

  UserList copyWith({
    int? active,
    List<User>? profiles,
  }) =>
      UserList(
        active: active == -1 ? null : active ?? this.active,
        profiles: profiles ?? this.profiles,
      );
}
