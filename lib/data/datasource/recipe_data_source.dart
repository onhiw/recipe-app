import 'package:dio/dio.dart';
import 'package:recipe_app/constants/constant.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/utils/exceptions.dart';

abstract class RecipeDataSource {
  Future<RecipeModel> getRecipes();
}

class RecipeDataSourceImpl implements RecipeDataSource {
  final Dio dio;

  RecipeDataSourceImpl({required this.dio});

  @override
  Future<RecipeModel> getRecipes() async {
    try {
      Response res = await dio.get('$baseUrl/recipe');

      if (res.statusCode == 200) {
        final RecipeModel recipeModel = RecipeModel.fromJson(res.data);
        return recipeModel;
      } else {
        throw DioExceptions.fromDioError(
                statusCode: res.statusCode, errorFrom: "getRecipes")
            .errorMessage();
      }
    } on DioError catch (err) {
      throw DioExceptions.fromDioError(dioError: err, errorFrom: "getRecipes")
          .errorMessage();
    }
  }
}
