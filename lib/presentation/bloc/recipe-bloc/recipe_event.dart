part of 'recipe_bloc.dart';

sealed class RecipeEvent extends Equatable {}

class GetEventRecipe extends RecipeEvent {
  final String query;

  GetEventRecipe(this.query);

  @override
  List<Object> get props => [query];
}
