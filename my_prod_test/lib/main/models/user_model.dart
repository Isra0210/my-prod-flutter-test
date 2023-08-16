import 'package:equatable/equatable.dart';

class UserModel implements Equatable {
  UserModel({
    this.id,
    this.name,
    this.avatarUrl,
    this.bio,
  });

  final int? id;
  final String? name;
  final String? avatarUrl;
  final String? bio;

  @override
  List<Object?> get props => [id, name, avatarUrl, bio];

  @override
  bool? get stringify => true;

  factory UserModel.fromMap(Map map) => UserModel(
        id: map['id'],
        name: map['name'],
        avatarUrl: map['avatar_url'],
        bio: map['createdAt'],
      );

  @override
  String toString() => "id: $id, name: $name, bio: $bio";
}
