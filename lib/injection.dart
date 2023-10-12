import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/datasource/category_data_source.dart';
import 'package:recipe_app/data/datasource/recipe_data_source.dart';
import 'package:recipe_app/data/repositories/category_repository_impl.dart';
import 'package:recipe_app/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repositories/category_repository.dart';
import 'package:recipe_app/domain/repositories/recipe_repository.dart';
import 'package:recipe_app/domain/usecases/get_category.dart';
import 'package:recipe_app/domain/usecases/get_recipe.dart';
import 'package:recipe_app/presentation/bloc/category-bloc/category_bloc.dart';
import 'package:recipe_app/presentation/bloc/recipe-bloc/recipe_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => CategoryBloc(locator()));
  locator.registerFactory(() => RecipeBloc(locator()));

  locator.registerLazySingleton(() => GetCategory(locator()));
  locator.registerLazySingleton(() => GetRecipe(locator()));

  locator.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(categoryDataSource: locator()),
  );
  locator.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(recipeDataSource: locator()),
  );

  locator.registerLazySingleton<CategoryDataSource>(
      () => CategoryDataSourceImpl());
  locator.registerLazySingleton<RecipeDataSource>(() => RecipeDataSourceImpl());
}
