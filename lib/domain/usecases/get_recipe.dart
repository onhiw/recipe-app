import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/domain/repositories/recipe_repository.dart';

class GetRecipe {
  final RecipeRepository recipeRepository;

  GetRecipe(this.recipeRepository);

  Future<RecipeModel> execute() {
    return recipeRepository.getRecipes();
  }
}
