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
    this.image = '',
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
}
