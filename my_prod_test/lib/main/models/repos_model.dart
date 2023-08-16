import 'package:equatable/equatable.dart';

class ReposModel implements Equatable {
  ReposModel({
    this.id,
    this.fullName,
  });

  final int? id;
  final String? fullName;

  @override
  List<Object?> get props => [
        id,
        fullName,
      ];

  @override
  bool? get stringify => true;

  factory ReposModel.fromMap(Map map) => ReposModel(
        id: map['id'],
        fullName: map['full_name'],
      );

  @override
  String toString() => "id: $id, fullName: $fullName";
}
