
import 'package:json_annotation/json_annotation.dart';

part 'user_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangePasswordRequestModel {
  final String oldPassword;
  final String newPassword;

  ChangePasswordRequestModel({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => _$ChangePasswordRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordRequestModelToJson(this);

  static ChangePasswordRequestModel defaultInstance = ChangePasswordRequestModel(
    oldPassword: '',
    newPassword: '',
  );

  ChangePasswordRequestModel copyWith({
    String? oldPassword,
    String? newPassword,
  }) {
    return ChangePasswordRequestModel(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateAvatarRequestModel {
  final String avatar;

  UpdateAvatarRequestModel({
    required this.avatar,
  });

  factory UpdateAvatarRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateAvatarRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateAvatarRequestModelToJson(this);

  static UpdateAvatarRequestModel defaultInstance = UpdateAvatarRequestModel(
    avatar: '',
  );

  UpdateAvatarRequestModel copyWith({
    String? avatar,
  }) {
    return UpdateAvatarRequestModel(
      avatar: avatar ?? this.avatar,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateBasicInfoRequestModel {
  final String nickname;
  final String fullName;

  UpdateBasicInfoRequestModel({
    required this.nickname,
    required this.fullName,
  });

  factory UpdateBasicInfoRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateBasicInfoRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateBasicInfoRequestModelToJson(this);

  static UpdateBasicInfoRequestModel defaultInstance = UpdateBasicInfoRequestModel(
    nickname: '',
    fullName: '',
  );

  UpdateBasicInfoRequestModel copyWith({
    String? nickname,
    String? fullName,
  }) {
    return UpdateBasicInfoRequestModel(
      nickname: nickname ?? this.nickname,
      fullName: fullName ?? this.fullName,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateDetailInfoRequestModel {
  final String gender;
  final String phoneNumber;
  final String birthDate;
  final String address;
  final String socialUrl;

  UpdateDetailInfoRequestModel({
    required this.gender,
    required this.phoneNumber,
    required this.birthDate,
    required this.address,
    required this.socialUrl,
  });

  factory UpdateDetailInfoRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateDetailInfoRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateDetailInfoRequestModelToJson(this);

  static UpdateDetailInfoRequestModel defaultInstance = UpdateDetailInfoRequestModel(
    gender: 'MALE',
    phoneNumber: '',
    birthDate: '',
    address: '',
    socialUrl: '',
  );

  UpdateDetailInfoRequestModel copyWith({
    String? gender,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String? socialUrl,
  }) {
    return UpdateDetailInfoRequestModel(
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
      socialUrl: socialUrl ?? this.socialUrl,
    );
  }
}


@JsonSerializable(explicitToJson: true)
class UpdateEmailRequestModel {
  final String email;

  UpdateEmailRequestModel({
    required this.email,
  });

  factory UpdateEmailRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateEmailRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateEmailRequestModelToJson(this);

  static UpdateEmailRequestModel defaultInstance = UpdateEmailRequestModel(
    email: '',
  );

  UpdateEmailRequestModel copyWith({
    String? email,
  }) {
    return UpdateEmailRequestModel(
      email: email ?? this.email,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class SearchUserRequestModel {
  final String q;
  final int page;

  SearchUserRequestModel({
    required this.q,
    required this.page,
  });

  factory SearchUserRequestModel.fromJson(Map<String, dynamic> json) => _$SearchUserRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchUserRequestModelToJson(this);

  static SearchUserRequestModel defaultInstance = SearchUserRequestModel(
    q: '',
    page: 1,
  );

  SearchUserRequestModel copyWith({
    String? q,
    int? page,
  }) {
    return SearchUserRequestModel(
      q: q ?? this.q,
      page: page ?? this.page,
    );
  }
}