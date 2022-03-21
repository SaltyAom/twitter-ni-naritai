// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 1;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      username: fields[1] as String,
      name: fields[2] as String,
      alias: fields[3] as String,
      image: fields[4] as String,
      token: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.alias)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfileListAdapter extends TypeAdapter<ProfileList> {
  @override
  final int typeId = 2;

  @override
  ProfileList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileList(
      active: fields[1] as int?,
      profiles: (fields[2] as List).cast<Profile>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProfileList obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.active)
      ..writeByte(2)
      ..write(obj.profiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      username: json['username'] as String,
      name: json['name'] as String,
      alias: json['alias'] as String,
      image: json['image'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'alias': instance.alias,
      'image': instance.image,
      'token': instance.token,
    };
