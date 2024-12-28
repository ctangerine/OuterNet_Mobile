import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class UserEntity {
  final int? id;
  final String? nickname;
  final String? fullName;
  final String? email;
  final String? gender;
  final String? phoneNumber;
  final String? socialUrl;
  final String? avatar;
  final double? score;
  final DateTime? createdAt;
  final String? role;
  final String? address;
  final DateTime? birthDate;

  UserEntity({
    this.id,
    this.nickname,
    this.fullName,
    this.email,
    this.gender,
    this.phoneNumber,
    this.socialUrl,
    this.avatar,
    this.score,
    this.createdAt,
    this.role,
    this.address,
    this.birthDate,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  UserEntity copyWith({
    int? id,
    String? nickname,
    String? fullName,
    String? email,
    String? gender,
    String? phoneNumber,
    String? socialUrl,
    String? avatar,
    double? score,
    DateTime? createdAt,
    String? role,
    String? address,
    DateTime? birthDate,
  }) {
    return UserEntity(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      socialUrl: socialUrl ?? this.socialUrl,
      avatar: avatar ?? this.avatar,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
      role: role ?? this.role,
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  static UserEntity defaultInstance = UserEntity(
    id: 0,
    nickname: '',
    fullName: '',
    email: '',
    gender: '',
    phoneNumber:  '',
    socialUrl: '',
    avatar: '',
    score: 0.0,
    createdAt: DateTime.now(),
    role: '',
    address: '',
    birthDate: DateTime.now(),
  );
}