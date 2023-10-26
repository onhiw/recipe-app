import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/constants/constant.dart';
import 'package:recipe_app/data/datasource/recipe_data_source.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/utils/exceptions.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late RecipeDataSourceImpl recipeDataSourceImpl;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    recipeDataSourceImpl = RecipeDataSourceImpl(dio: mockDio);
  });

  group('fetch recipes', () {
    final tRecipesModel =
        RecipeModel.fromJson(json.decode(readJson('dummy_data/recipes.json')))
            .data;

    test('should return list of Recipe Model when the response code is 200',
        () async {
      //arrange
      when(mockDio.get('$baseUrl/recipe')).thenAnswer((_) async => Response(
          data: json.decode(readJson('dummy_data/recipes.json')),
          statusCode: 200,
          requestOptions: RequestOptions(path: '$baseUrl/recipe')));

      //act
      final result = await recipeDataSourceImpl.getRecipes();

      //assert
      expect(result.data, equals(tRecipesModel));
    });

    test('should throw a Exception when the response code is 400 or other',
        () async {
      //arrange
      when(mockDio.get('$baseUrl/recipe')).thenAnswer((_) async => Response(
          data: 'Bad Request',
          statusCode: 400,
          requestOptions: RequestOptions(path: '$baseUrl/recipe')));

      //act
      final call = recipeDataSourceImpl.getRecipes();

      //assert
      expect(() => call, throwsA(isA<DioExceptions>()));
    });
  });
}
