import 'package:nawel/domain/model/restaurant_model.dart';
import 'package:nawel/domain/repos/food_repo.dart';

class GetCategoriesUseCase {
  final FoodRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<Categoory>> call() => repository.getCategories();
}
class GetRestaurantsUseCase {
  final FoodRepository repository;

  GetRestaurantsUseCase(this.repository);

  Future<List<Restaurant>> call() => repository.getRestaurants();
}
