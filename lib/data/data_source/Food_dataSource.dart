import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel/domain/model/restaurant_model.dart';

class FirebaseFoodDataSource {
  final FirebaseFirestore firestore;

  FirebaseFoodDataSource(this.firestore);

  Future<List<Categoory>> getCategories() async {
    final snapshot = await firestore.collection('categories').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Categoory(
        name: data['name'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
      );
    }).toList();
  }

  Future<List<Restaurant>> getRestaurants() async {
    final snapshot = await firestore.collection('restaurants').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Restaurant(
        name: data['name'] ?? '',
        description: data['description'] ?? '',
        deliveryTime: data['deliveryTime'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
      );
    }).toList();
  }
}
