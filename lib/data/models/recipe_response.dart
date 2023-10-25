import 'package:equatable/equatable.dart';

class RecipeResponse extends Equatable {
  final String? calories;
  final String? carbos;
  final String? description;
  final int? difficulty;
  final String? fats;
  final String? headline;
  final String? id;
  final String? image;
  final String? name;
  final String? proteins;
  final String? thumb;
  final String? time;

  const RecipeResponse({
    this.calories,
    this.carbos,
    this.description,
    this.difficulty,
    this.fats,
    this.headline,
    this.id,
    this.image,
    this.name,
    this.proteins,
    this.thumb,
    this.time,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) => RecipeResponse(
        calories: json["calories"],
        carbos: json["carbos"],
        description: json["description"],
        difficulty: json["difficulty"],
        fats: json["fats"],
        headline: json["headline"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        proteins: json["proteins"],
        thumb: json["thumb"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "carbos": carbos,
        "description": description,
        "difficulty": difficulty,
        "fats": fats,
        "headline": headline,
        "id": id,
        "image": image,
        "name": name,
        "proteins": proteins,
        "thumb": thumb,
        "time": time,
      };

  @override
  List<Object?> get props => [
        calories,
        carbos,
        description,
        difficulty,
        fats,
        headline,
        id,
        image,
        name,
        proteins,
        thumb,
        time
      ];
}
