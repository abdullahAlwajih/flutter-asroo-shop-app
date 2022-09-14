import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../core/styles/app_themes.dart';

class ProductModels {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category? category;
  final String image;
  final Rating rating;
  final List<Color> colors;

  const ProductModels(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating,
      this.colors = const [
        kColor1,
        kColor2,
        kColor3,
        kColor4,
        kColor5,
        kColor2,
        kColor3,
        kColor4,
      ]});

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: categoryValues.map![json["category"]],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse![category],
        "image": image,
        "rating": rating.toJson(),
      };

  static List<ProductModels> fromJsonList(String str) =>
      List<ProductModels>.from(
          json.decode(str).map((x) => ProductModels.fromJson(x)));

  static String toJsonList(List<ProductModels> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

enum Category { kMenSClothing, kJEWELERY, kELECTRONICS, kWomenSClothing }

final categoryValues = EnumValues({
  "electronics": Category.kELECTRONICS,
  "jewelery": Category.kJEWELERY,
  "men's clothing": Category.kMenSClothing,
  "women's clothing": Category.kWomenSClothing
});

class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  final Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get  reverse =>
      reverseMap ??= map!.map((k, v) => MapEntry(v, k));
}
