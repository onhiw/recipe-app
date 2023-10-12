import 'package:recipe_app/data/datasource/category_data_source.dart';
import 'package:recipe_app/data/models/category_model.dart';
import 'package:recipe_app/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImpl({
    required this.categoryDataSource,
  });

  @override
  Future<CategoryModel> getCategory() async {
    try {
      final result = await categoryDataSource.getCategoryRecipes();
      return result;
    } catch (err) {
      rethrow;
    }
  }
}
