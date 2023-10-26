import 'package:dartz/dartz.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/domain/repositories/recipe_repository.dart';
import 'package:recipe_app/utils/failure.dart';

class GetRecipe {
  final RecipeRepository recipeRepository;

  GetRecipe(this.recipeRepository);

  Future<Either<Failure, RecipeModel>> execute() {
    return recipeRepository.getRecipes();
  }
}
