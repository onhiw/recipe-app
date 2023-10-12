import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/models/recipe_model.dart';
import 'package:recipe_app/domain/usecases/get_recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GetRecipe getRecipe;
  RecipeBloc(this.getRecipe) : super(RecipeInitial()) {
    on<RecipeEvent>((event, emit) async {
      if (event is GetEventRecipe) {
        try {
          emit(RecipeLoading());

          final RecipeModel recipeModel = await getRecipe.execute(event.query);
          emit(RecipeLoaded(recipeModel));
        } catch (err) {
          emit(RecipeError(err));
        }
      }
    });
  }
}
