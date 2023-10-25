import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:recipe_app/data/datasource/recipe_data_source.dart';
import 'package:recipe_app/domain/repositories/recipe_repository.dart';

@GenerateMocks([RecipeDataSource, RecipeRepository],
    customMocks: [MockSpec<Dio>(as: #MockDio)])
void main() {}
