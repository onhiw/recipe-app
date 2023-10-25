import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/recipe_response.dart';

class RecipeModel extends Equatable {
  final String? message;
  final List<RecipeResponse>? data;

  const RecipeModel({
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

  @override
  List<Object?> get props => [message, data];
}
