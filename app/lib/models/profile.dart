import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Profile {
  Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  Profile copyWith({
    String? username,
    String? name,
    String? alias,
    String? image,
    String? token,
  }) =>
      Profile(
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
class ProfileList {
  ProfileList({
    this.active,
    required this.profiles,
  });

  @HiveField(1)
  final int? active;

  @HiveField(2)
  final List<Profile> profiles;

  ProfileList copyWith({
    int? active,
    List<Profile>? profiles,
  }) =>
      ProfileList(
        active: active == -1 ? null : active ?? this.active,
        profiles: profiles ?? this.profiles,
      );
}
