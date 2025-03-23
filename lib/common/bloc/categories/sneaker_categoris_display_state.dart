import '../../../domain/category/entity/category.dart';

abstract class SneakerCategoriesDisplayState {}

// Loading State
class SneakerCategoriesLoading extends SneakerCategoriesDisplayState {}

// Loaded State
class SneakerCategoriesLoaded extends SneakerCategoriesDisplayState {
  final List<CategoryEntity> categories;
  SneakerCategoriesLoaded({required this.categories});
}

// Failed State
class SneakerCategoriesLoadFailure extends SneakerCategoriesDisplayState {}