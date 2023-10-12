import 'dart:convert';

import 'package:recipe_app/data/models/recipe_response.dart';

RecipeModel recipeModelFromJson(String str) =>
    RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  List<RecipeResponse>? meals;

  RecipeModel({
    this.meals,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        meals: json["meals"] == null
            ? []
            : List<RecipeResponse>.from(
                json["meals"]!.map((x) => RecipeResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": meals == null
            ? []
            : List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}
