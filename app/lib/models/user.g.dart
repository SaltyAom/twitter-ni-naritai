// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      username: fields[1] as String,
      name: fields[2] as String,
      alias: fields[3] as String,
      image: fields[4] as String,
      token: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
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
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserListAdapter extends TypeAdapter<UserList> {
  @override
  final int typeId = 2;

  @override
  UserList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserList(
      active: fields[1] as int?,
      profiles: (fields[2] as List).cast<User>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserList obj) {
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
      other is UserListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      name: json['name'] as String,
      alias: json['alias'] as String,
      image: json['image'] as String? ??
          'https://pbs.twimg.com/profile_images/1501586627906338818/0WKZDMPZ_400x400.jpg',
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'alias': instance.alias,
      'image': instance.image,
      'token': instance.token,
    };
