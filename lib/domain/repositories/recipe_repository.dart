import 'package:recipe_app/data/models/recipe_model.dart';

abstract class RecipeRepository {
  Future<RecipeModel> getRecipes();
}
