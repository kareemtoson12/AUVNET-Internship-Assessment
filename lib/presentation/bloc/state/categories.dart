import 'package:equatable/equatable.dart';
import 'package:nawel/domain/model/restaurant_model.dart';

class CategoriesState extends Equatable {
  final bool isLoading;
  final List<Categoory> categories;
  final String? error;

  const CategoriesState({
    this.isLoading = false,
    this.categories = const [],
    this.error,
  });

  CategoriesState copyWith({
    bool? isLoading,
    List<Categoory>? categories,
    String? error,
  }) {
    return CategoriesState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, categories, error];
}
