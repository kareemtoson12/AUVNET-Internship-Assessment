class ServiceModel {
  final String name;
  final String imageUrl;
  final String tag;
  final int order;

  ServiceModel({
    required this.name,
    required this.imageUrl,
    required this.tag,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'imageUrl': imageUrl, 'tag': tag, 'order': order};
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      tag: map['tag'] ?? '',
      order: map['order'] ?? 0,
    );
  }
}
