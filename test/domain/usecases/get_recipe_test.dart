import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/domain/usecases/get_recipe.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetRecipe getRecipe;
  late MockRecipeRepository mockRecipeRepository;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    getRecipe = GetRecipe(mockRecipeRepository);
  });

  RecipeModel tRecipe = const RecipeModel();

  test('should get list of recipe from the repository', () async {
    //arrange
    when(mockRecipeRepository.getRecipes())
        .thenAnswer((_) async => Right(tRecipe));

    //act
    final result = await getRecipe.execute();

    //assert
    expect(result, Right(tRecipe));
  });
}
