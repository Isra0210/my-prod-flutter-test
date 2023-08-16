import 'package:equatable/equatable.dart';

class ReposModel implements Equatable {
  ReposModel({
    this.id,
    this.fullName,
    this.language,
    this.description,
    this.stargazersCount,
    this.forkCount,
  });

  final int? id;
  final String? fullName;
  final String? language;
  final String? description;
  final int? stargazersCount;
  final int? forkCount;

  @override
  List<Object?> get props => [
        id,
        fullName,
        language,
        description,
        stargazersCount,
        forkCount,
      ];

  @override
  bool? get stringify => true;

  factory ReposModel.fromJson(json) => ReposModel(
        id: json['id'],
        fullName: json['full_name'],
        language: json['language'],
        description: json['description'],
        stargazersCount: json['stargazers_count'],
        forkCount: json['forks_count'],
      );

  @override
  String toString() => "id: $id, fullName: $fullName";
}
