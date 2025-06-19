class Restaurant {
  final String name;
  final String description;
  final String deliveryTime;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.description,
    required this.deliveryTime,
    required this.imageUrl,
  });
}

class Categoory {
  final String name;
  final String imageUrl;

  Categoory({required this.name, required this.imageUrl});
}
