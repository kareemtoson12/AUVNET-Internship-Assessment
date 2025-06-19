import 'package:nawel/domain/model/restaurant_model.dart';

abstract class FoodRepository {
  Future<List<Categoory>> getCategories();
  Future<List<Restaurant>> getRestaurants();
}
