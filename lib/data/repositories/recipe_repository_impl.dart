import 'package:dio/dio.dart';
import 'package:recipe_app/data/datasource/recipe_data_source.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/utils/exceptions.dart';

class RecipeRepositoryImpl implements RecipeDataSource {
  @override
  Future<RecipeModel> searchRecipes(String query) async {
    final Dio dio = Dio();

    try {
      Response res =
          await dio.get('/search.php', queryParameters: {"s": query});

      final RecipeModel recipeModel = RecipeModel.fromJson(res.data);
      return recipeModel;
    } on DioError catch (err) {
      throw DioExceptions.fromDioError(
              dioError: err, errorFrom: "searchRecipes")
          .errorMessage();
    }
  }
}