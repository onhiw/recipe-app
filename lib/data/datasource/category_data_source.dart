import 'package:dio/dio.dart';
import 'package:recipe_app/constants/constant.dart';
import 'package:recipe_app/data/models/category_model.dart';
import 'package:recipe_app/utils/exceptions.dart';

abstract class CategoryDataSource {
  Future<CategoryModel> getCategoryRecipes();
}

class CategoryDataSourceImpl implements CategoryDataSource {
  @override
  Future<CategoryModel> getCategoryRecipes() async {
    final Dio dio = Dio();

    try {
      Response res = await dio.get('$baseUrl/categories.php');

      final CategoryModel categoryModel = CategoryModel.fromJson(res.data);
      return categoryModel;
    } on DioError catch (err) {
      throw DioExceptions.fromDioError(
              dioError: err, errorFrom: "getCategoryRecipes")
          .errorMessage();
    }
  }
}
