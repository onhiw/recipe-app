import 'package:dartz/dartz.dart';
import 'package:recipe_app/data/datasource/recipe_data_source.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/domain/repositories/recipe_repository.dart';
import 'package:recipe_app/utils/exceptions.dart';
import 'package:recipe_app/utils/failure.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource recipeDataSource;

  RecipeRepositoryImpl({
    required this.recipeDataSource,
  });

  @override
  Future<Either<Failure, RecipeModel>> getRecipes() async {
    try {
      final result = await recipeDataSource.getRecipes();
      return Right(result);
    } on DioExceptions {
      // print(err);
      return const Left(ServerFailure(''));
    }
  }
}
