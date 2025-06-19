import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';
import 'package:nawel/presentation/screens/home/widget/service_card.dart';
import 'package:nawel/presentation/screens/home/widget/products_grid.dart';
import 'package:nawel/presentation/routes/app_routes.dart';
import 'package:nawel/presentation/screens/widgets/primary_button.dart';
import 'package:nawel/presentation/screens/widgets/custom_input_field.dart';
import 'package:nawel/presentation/screens/widgets/shimmer_loading.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            SizedBox(width: screenHeight * 0.015),
            Text(
              'Services:',
              style: TextStyle(
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ServiceCard(
              imagePath: 'assets/images/pp.png',
              title: 'Food',
              tag: 'Up to 50%',
              tagColor: AppColors.primaryPurple,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => ServiceProductsScreen(serviceTitle: 'Food'),
                    ),
                  ),
            ),
            ServiceCard(
              imagePath: 'assets/images/medicen.png',
              title: 'Health &wellness',
              tag: '20mins',
              tagColor: AppColors.primaryPurple,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => ServiceProductsScreen(
                            serviceTitle: 'Health & Wellness',
                          ),
                    ),
                  ),
            ),
            ServiceCard(
              imagePath: 'assets/images/gorces.png',
              title: 'Groceries',
              tag: '15 mins',
              tagColor: AppColors.primaryPurple,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) =>
                              ServiceProductsScreen(serviceTitle: 'Groceries'),
                    ),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class ServiceProductsScreen extends StatefulWidget {
  final String serviceTitle;

  const ServiceProductsScreen({super.key, required this.serviceTitle});

  @override
  State<ServiceProductsScreen> createState() => _ServiceProductsScreenState();
}

class _ServiceProductsScreenState extends State<ServiceProductsScreen> {
  late TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchItemsForService(String title) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('services')
            .where('title', isEqualTo: title)
            .get();
    if (snapshot.docs.isNotEmpty) {
      return List<Map<String, dynamic>>.from(snapshot.docs.first['items']);
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: AppColors.primaryPurple,
          elevation: 0,
          title: Text(
            widget.serviceTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    constraints.maxWidth < 500
                        ? 12
                        : constraints.maxWidth * 0.08,
                vertical: constraints.maxWidth < 500 ? 8 : 24,
              ),
              child: Column(
                children: [
                  CustomInputField(
                    hintText: 'Search products...',
                    prefixIcon: Icons.search,
                    controller: _searchController,
                    onChanged: (String val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                  ),
                  SizedBox(height: constraints.maxWidth < 500 ? 12 : 20),
                  Expanded(
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: fetchItemsForService(widget.serviceTitle),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ProductsGrid(
                            constraints: constraints,
                            items: List.generate(6, (index) => null),
                            isLoading: true,
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('❌ Error: ${snapshot.error}'),
                          );
                        } else if (snapshot.data == null ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No products found'));
                        }

                        var items = snapshot.data!;
                        if (_searchQuery.isNotEmpty) {
                          items =
                              items
                                  .where(
                                    (item) => (item['name'] ?? '')
                                        .toString()
                                        .toLowerCase()
                                        .contains(_searchQuery.toLowerCase()),
                                  )
                                  .toList();
                        }

                        return ProductsGrid(
                          constraints: constraints,
                          items: items,
                          isLoading: false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
