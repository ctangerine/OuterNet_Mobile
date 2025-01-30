

import 'package:json_annotation/json_annotation.dart';

part 'report_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final int? id;
  final String? name;
  final String? description;

  Category({
    this.id,
    this.name,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  static Category get defaultInstance => Category(
    id: 0,
    name: '',
    description: '',
  );
}

@JsonSerializable(explicitToJson: true)
class CategoryResponseModel {
  final List<Category>? categories;

  CategoryResponseModel({
    this.categories,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => _$CategoryResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);

  CategoryResponseModel copyWith({
    List<Category>? categories,
  }) {
    return CategoryResponseModel(
      categories: categories ?? this.categories,
    );
  }

  static CategoryResponseModel get defaultInstance => CategoryResponseModel(
    categories: [],
  );

  List<Category> getCategories() {
    return categories ?? [];
  }
}