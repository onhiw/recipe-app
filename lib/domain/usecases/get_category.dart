import 'package:recipe_app/data/models/category_model.dart';
import 'package:recipe_app/domain/repositories/category_repository.dart';

class GetCategory {
  final CategoryRepository categoryRepository;

  GetCategory(this.categoryRepository);

  Future<CategoryModel> execute() {
    return categoryRepository.getCategory();
  }
}
