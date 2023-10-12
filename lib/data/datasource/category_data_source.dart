import 'package:recipe_app/data/models/category_model.dart';

abstract class CategoryDataSource {
  Future<CategoryModel> getCategoryRecipes();
}
