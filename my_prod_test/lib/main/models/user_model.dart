import 'package:equatable/equatable.dart';

class UserModel implements Equatable {
  UserModel({
    this.id,
    this.name,
    this.avatarUrl,
    this.bio,
    this.publicRepos,
    this.login,
  });

  final int? id;
  final String? name;
  final String? avatarUrl;
  final String? bio;
  final int? publicRepos;
  final String? login;

  @override
  List<Object?> get props => [id, name, avatarUrl, bio];

  @override
  bool? get stringify => true;

  factory UserModel.fromJson(Map json) => UserModel(
        id: json['id'],
        name: json['name'],
        avatarUrl: json['avatar_url'],
        bio: json['bio'],
        publicRepos: json['public_repos'],
        login: json['login']
      );

  @override
  String toString() => "id: $id, name: $name, bio: $bio";
}
