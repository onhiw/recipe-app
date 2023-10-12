part of 'recipe_bloc.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final RecipeModel recipeModel;
  const RecipeLoaded(this.recipeModel);

  @override
  List<Object> get props => [recipeModel];
}

class RecipeError extends RecipeState {
  final dynamic message;
  const RecipeError(this.message);

  @override
  List<Object> get props => [message];
}
