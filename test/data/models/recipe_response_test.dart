import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/data/models/recipe_response.dart';

import '../../json_reader.dart';

void main() {
  const tRecipeResponse = RecipeResponse(
      calories: "516 kcal",
      carbos: "47 g",
      description:
          "There’s nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!",
      difficulty: 0,
      fats: "8 g",
      headline: "with Sweet Potato Wedges and Minted Snap Peas",
      id: "533143aaff604d567f8b4571",
      image:
          "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
      name: "Crispy Fish Goujons ",
      proteins: "43 g",
      thumb:
          "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
      time: "PT35M");

  const tRecipeModel =
      RecipeModel(message: "Success", data: <RecipeResponse>[tRecipeResponse]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/recipes.json'));

      //act
      final result = RecipeModel.fromJson(jsonMap);

      //assert
      expect(result, tRecipeModel);
    });
  });

  group('toJson', () {
    test('should return a valid model to JSON', () async {
      //arrange
      final result = tRecipeModel.toJson();

      //act
      final tExpectedJsonMap = json.decode(readJson('dummy_data/recipes.json'));

      //assert
      expect(result, tExpectedJsonMap);
    });
  });
}
