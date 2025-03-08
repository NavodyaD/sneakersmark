// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../domain/category/entity/category.dart';

class CategoryModel {
  final String snCategorytitle;
  final String categoryId;
  final String catImage;

  CategoryModel({
    required this.snCategorytitle,
    required this.categoryId,
    required this.catImage
  });

  // generate JSON serialization option of CategoryModel

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'snCategorytitle': snCategorytitle,
      'categoryId': categoryId,
      'catImage': catImage,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      snCategorytitle: map['snCategorytitle'] as String,
      categoryId: map['categoryId'] as String,
      catImage: map['catImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
        categoryId: categoryId,
        catImage: catImage,
        snCategorytitle: snCategorytitle
    );
  }
}