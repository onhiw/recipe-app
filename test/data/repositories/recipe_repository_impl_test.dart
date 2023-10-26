import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/data/models/recipe_response.dart';
import 'package:recipe_app/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_app/utils/exceptions.dart';
import 'package:recipe_app/utils/failure.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late RecipeRepositoryImpl recipeRepositoryImpl;
  late MockRecipeDataSource mockRecipeDataSource;

  setUp(() {
    mockRecipeDataSource = MockRecipeDataSource();
    recipeRepositoryImpl =
        RecipeRepositoryImpl(recipeDataSource: mockRecipeDataSource);
  });

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

  group('Recipes', () {
    test(
        'should return recipe data when the call to recipe data source is successful',
        () async {
      //arrange
      when(mockRecipeDataSource.getRecipes())
          .thenAnswer((_) async => tRecipeModel);
      //act
      final result = await recipeRepositoryImpl.getRecipes();
      //assert
      verify(mockRecipeDataSource.getRecipes());
      final results = result.getOrElse(() =>
          const RecipeModel(message: "Success", data: <RecipeResponse>[]));
      expect(results, tRecipeModel);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      //arrange

      when(mockRecipeDataSource.getRecipes()).thenThrow(DioExceptions());

      //act
      final result = await recipeRepositoryImpl.getRecipes();
      //assert
      verify(mockRecipeDataSource.getRecipes());
      expect(result, equals(const Left(ServerFailure(''))));
    });
  });
}
