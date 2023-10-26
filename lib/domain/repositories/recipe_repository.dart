import 'package:dartz/dartz.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/utils/failure.dart';

abstract class RecipeRepository {
  Future<Either<Failure, RecipeModel>> getRecipes();
}
