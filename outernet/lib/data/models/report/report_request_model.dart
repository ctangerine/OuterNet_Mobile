import 'package:json_annotation/json_annotation.dart';

part 'report_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SiteReportRequestModel {
  final int? siteId;
  final int? categoryId;
  final String? description;

  SiteReportRequestModel({
    this.siteId,
    this.categoryId,
    this.description,
  });

  factory SiteReportRequestModel.fromJson(Map<String, dynamic> json) => _$SiteReportRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SiteReportRequestModelToJson(this);

  SiteReportRequestModel copyWith({
    int? siteId,
    int? categoryId,
    String? description,
  }) {
    return SiteReportRequestModel(
      siteId: siteId ?? this.siteId,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
    );
  }

  static SiteReportRequestModel get defaultInstance => SiteReportRequestModel(
    siteId: 0,
    categoryId: 0,
    description: '',
  );
}

@JsonSerializable(explicitToJson: true)
class UserReportRequestModel {
  final int? userId;
  final int? categoryId;
  final String? description;

  UserReportRequestModel({
    this.userId,
    this.categoryId,
    this.description,
  });

  factory UserReportRequestModel.fromJson(Map<String, dynamic> json) => _$UserReportRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserReportRequestModelToJson(this);

  UserReportRequestModel copyWith({
    int? userId,
    int? categoryId,
    String? description,
  }) {
    return UserReportRequestModel(
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
    );
  }

  static UserReportRequestModel get defaultInstance => UserReportRequestModel(
    userId: 0,
    categoryId: 0,
    description: '',
  );
}

@JsonSerializable(explicitToJson: true)
class SiteReviewReportRequestModel {
  final int? siteReviewId;
  final int? categoryId;
  final String? description;

  SiteReviewReportRequestModel({
    this.siteReviewId,
    this.categoryId,
    this.description,
  });

  factory SiteReviewReportRequestModel.fromJson(Map<String, dynamic> json) => _$SiteReviewReportRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SiteReviewReportRequestModelToJson(this);

  SiteReviewReportRequestModel copyWith({
    int? siteReviewId,
    int? categoryId,
    String? description,
  }) {
    return SiteReviewReportRequestModel(
      siteReviewId: siteReviewId ?? this.siteReviewId,
      categoryId: categoryId,
      description: description ?? this.description,
    );
  }

  static SiteReviewReportRequestModel get defaultInstance => SiteReviewReportRequestModel(
    siteReviewId: 0,
    categoryId: 0,
    description: '',
  );

}