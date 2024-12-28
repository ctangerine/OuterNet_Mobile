import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/domain/entities/user_entity.dart';

part 'user_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUserDetailResponseModel {
  final int id;
  final String? nickname;
  final String? fullName;
  final String? email;
  final String? gender;
  final String? socialUrl;
  final String? avatar;
  final double? score;
  final DateTime? createdAt;

  GetUserDetailResponseModel({
    required this.id,
    this.nickname,
    this.fullName,
    this.email,
    this.gender,
    this.socialUrl,
    this.avatar,
    this.score,
    this.createdAt,
  });

  factory GetUserDetailResponseModel.fromJson(Map<String, dynamic> json) => _$GetUserDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserDetailResponseModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      nickname: nickname,
      fullName: fullName,
      email: email,
      gender: gender,
      phoneNumber: null,
      socialUrl: socialUrl,
      avatar: avatar,
      score: score ?? 0.0,
      createdAt: createdAt ?? DateTime(1970, 1, 1),
    );
  }

  static GetUserDetailResponseModel defaultInstance = GetUserDetailResponseModel(
    id: 0,
    nickname: 'Unknown',
    fullName: 'Unknown',
    email: 'unknown@example.com',
    gender: 'Unknown',
    socialUrl: 'Unknown',
    avatar: 'Unknown',
    score: 0.0,
    createdAt: DateTime(1970, 1, 1),
  );

  GetUserDetailResponseModel copyWith({
    int? id,
    String? nickname,
    String? fullName,
    String? email,
    String? gender,
    String? socialUrl,
    String? avatar,
    double? score,
    DateTime? createdAt,
  }) {
    return GetUserDetailResponseModel(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      socialUrl: socialUrl ?? this.socialUrl,
      avatar: avatar ?? this.avatar,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateAvatarResposneModel {
  final String avatar;
  
  UpdateAvatarResposneModel({
    required this.avatar,
  });

  static UpdateAvatarResposneModel defaultInstance = UpdateAvatarResposneModel(
    avatar: '',
  );

  UpdateAvatarResposneModel copyWith({
    String? avatar,
  }) {
    return UpdateAvatarResposneModel(
      avatar: avatar ?? this.avatar,
    );
  }
}



@JsonSerializable(explicitToJson: true)
class SearchUserResponseModel {
  final List<UserData> data;
  final Pagination pagination;

  SearchUserResponseModel({
    required this.data,
    required this.pagination,
  });

  factory SearchUserResponseModel.fromJson(Map<String, dynamic> json) => _$SearchUserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUserResponseModelToJson(this);

  static SearchUserResponseModel defaultInstance = SearchUserResponseModel(
    data: [],
    pagination: Pagination(
      currentPage: 0,
      totalPages: 0,
      totalItems: 0,
      itemsPerPage: 0,
    ),
  );

  SearchUserResponseModel copyWith({
    List<UserData>? data,
    Pagination? pagination,
  }) {
    return SearchUserResponseModel(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  List<UserEntity> toEntities() {
    List<UserEntity> entities = [];
    for (var element in data) {
      entities.add(
        UserEntity.defaultInstance.copyWith(
          id: element.id,
          nickname: element.nickname,
          fullName: element.fullName,
          avatar: element.avatar,
        ),
      );
    }
    return entities;
  }
}

@JsonSerializable(explicitToJson: true)
class UserData {
  final int id;
  final String? nickname;
  final String? fullName;
  final String? avatar;

  UserData({
    required this.id,
    this.nickname,
    this.fullName,
    this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Pagination {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;

  Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  Pagination copyWith({
    int? currentPage,
    int? totalPages,
    int? totalItems,
    int? itemsPerPage,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
    );
  }

  static Pagination defaultInstance = Pagination(
    currentPage: 0,
    totalPages: 0,
    totalItems: 0,
    itemsPerPage: 0,
  );
}