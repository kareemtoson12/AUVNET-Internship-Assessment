import 'package:nawel/data/data_source/Food_dataSource.dart';
import 'package:nawel/domain/model/restaurant_model.dart';
import 'package:nawel/domain/repos/food_repo.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FirebaseFoodDataSource dataSource;

  FoodRepositoryImpl(this.dataSource);

  @override
  Future<List<Categoory>> getCategories() => dataSource.getCategories();

  @override
  Future<List<Restaurant>> getRestaurants() => dataSource.getRestaurants();
}
