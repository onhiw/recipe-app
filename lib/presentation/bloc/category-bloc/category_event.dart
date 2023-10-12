part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {}

class GetEventCategory extends CategoryEvent {
  @override
  List<Object> get props => [];
}
