import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/category_model.dart';
import 'package:recipe_app/domain/usecases/get_category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategory getCategory;
  CategoryBloc(this.getCategory) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetEventCategory) {
        try {
          emit(CategoryLoading());

          final CategoryModel categoryModel = await getCategory.execute();
          emit(CategoryLoaded(categoryModel));
        } catch (err) {
          emit(CategoryError(err));
        }
      }
    });
  }
}
