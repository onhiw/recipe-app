part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryModel categoryModel;
  const CategoryLoaded(this.categoryModel);

  @override
  List<Object> get props => [categoryModel];
}

class CategoryError extends CategoryState {
  final dynamic message;
  const CategoryError(this.message);

  @override
  List<Object> get props => [message];
}
