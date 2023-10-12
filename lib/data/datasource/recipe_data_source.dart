import 'package:recipe_app/data/models/recipe_model.dart';

abstract class RecipeDataSource {
  Future<RecipeModel> searchRecipes(String query);
}
