import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/datasource/recipe_data_source.dart';
import 'package:recipe_app/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repositories/recipe_repository.dart';
import 'package:recipe_app/domain/usecases/get_recipe.dart';
import 'package:recipe_app/presentation/bloc/recipe-bloc/recipe_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => RecipeBloc(locator()));

  locator.registerLazySingleton(() => GetRecipe(locator()));

  locator.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(recipeDataSource: locator()),
  );

  locator.registerLazySingleton<RecipeDataSource>(
      () => RecipeDataSourceImpl(dio: locator()));

  // external
  locator.registerLazySingleton(() => Dio());
}
