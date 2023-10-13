part of 'recipe_bloc.dart';

sealed class RecipeEvent extends Equatable {}

class GetEventRecipe extends RecipeEvent {
  @override
  List<Object> get props => [];
}
