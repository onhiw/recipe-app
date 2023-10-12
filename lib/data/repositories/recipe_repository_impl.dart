import 'package:recipe_app/data/datasource/recipe_data_source.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource recipeDataSource;

  RecipeRepositoryImpl({
    required this.recipeDataSource,
  });

  @override
  Future<RecipeModel> searchRecipe(String query) async {
    try {
      final result = await recipeDataSource.searchRecipes(query);
      return result;
    } catch (err) {
      rethrow;
    }
  }
}
