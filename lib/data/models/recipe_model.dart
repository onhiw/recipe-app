// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

import 'package:recipe_app/data/models/recipe_response.dart';

RecipeModel recipeModelFromJson(String str) =>
    RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  final String? message;
  final List<RecipeResponse>? data;

  RecipeModel({
    this.message,
    this.data,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<RecipeResponse>.from(
                json["data"]!.map((x) => RecipeResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
