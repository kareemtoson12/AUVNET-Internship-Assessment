import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> pushDummyServicesToFirestore() async {
  try {
    final firestore = FirebaseFirestore.instance;
    final servicesCollection = firestore.collection('services');

    final snapshot = await servicesCollection.get();
    if (snapshot.docs.isNotEmpty) {
      print('🔄 Dummy services already exist. Skipping insert.');
      return;
    }

    final services = [
      {
        'imagePath':
            'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
        'title': 'Food',
        'tag': 'Up to 50%',
        'tagColor': '#8A56AC',
        'route': 'food',
        'items': [
          {
            'name': 'Pepperoni Pizza',
            'image':
                'https://images.unsplash.com/photo-1601924582975-4c3b87eb05d8',
            'price': 9.99,
            'rating': 4.5,
          },
          {
            'name': 'Cheeseburger',
            'image':
                'https://images.unsplash.com/photo-1550547660-d9450f859349',
            'price': 7.50,
            'rating': 4.2,
          },
          {
            'name': 'Sushi Roll',
            'image':
                'https://images.unsplash.com/photo-1589308078054-83298151c4a9',
            'price': 12.00,
            'rating': 4.8,
          },
        ],
      },
      {
        'imagePath':
            'https://images.unsplash.com/photo-1588776814546-ec6fa0b3d5f4',
        'title': 'Health & Wellness',
        'tag': '20mins',
        'tagColor': '#8A56AC',
        'route': 'health',
        'items': [
          {
            'name': 'Pain Relief Pills',
            'image':
                'https://images.unsplash.com/photo-1580281657527-47d1b8c78c26',
            'price': 5.99,
            'rating': 4.1,
          },
          {
            'name': 'Vitamin C',
            'image':
                'https://images.unsplash.com/photo-1588776814546-ec6fa0b3d5f4',
            'price': 8.50,
            'rating': 4.4,
          },
          {
            'name': 'First Aid Kit',
            'image':
                'https://images.unsplash.com/photo-1583912268181-7e8ba2bd8ff2',
            'price': 15.00,
            'rating': 4.7,
          },
        ],
      },
      {
        'imagePath':
            'https://images.unsplash.com/photo-1606813908984-6a49a6c2502c',
        'title': 'Groceries',
        'tag': '15 mins',
        'tagColor': '#8A56AC',
        'route': 'groceries',
        'items': [
          {
            'name': 'Apples',
            'image':
                'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
            'price': 3.00,
            'rating': 4.6,
          },
          {
            'name': 'Milk',
            'image':
                'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144',
            'price': 2.20,
            'rating': 4.3,
          },
          {
            'name': 'Bread',
            'image':
                'https://images.unsplash.com/photo-1572441710530-0465b15f62d4',
            'price': 1.80,
            'rating': 4.0,
          },
        ],
      },
    ];

    for (final service in services) {
      await servicesCollection.add(service);
      print('✅ Added: ${service['title']}');
    }
  } catch (e) {
    print('❌ Error adding dummy services: $e');
  }
}
