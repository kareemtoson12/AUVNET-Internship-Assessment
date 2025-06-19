import 'package:flutter/material.dart';
import 'package:nawel/presentation/screens/home/widget/product_card.dart';
import 'package:nawel/presentation/screens/widgets/shimmer_loading.dart';

class ProductsGrid extends StatelessWidget {
  final BoxConstraints constraints;
  final List<dynamic> items;
  final bool isLoading;

  const ProductsGrid({
    super.key,
    required this.constraints,
    required this.items,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
    final aspectRatio = _getAspectRatio(constraints.maxWidth);
    final itemWidth =
        (constraints.maxWidth -
            (constraints.maxWidth < 500 ? 24 : constraints.maxWidth * 0.16) -
            ((crossAxisCount - 1) * 16)) /
        crossAxisCount;
    final imageHeight = constraints.maxHeight * 0.15;

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: aspectRatio,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (isLoading) {
          return ShimmerProductCard(
            width: itemWidth,
            height: itemWidth / aspectRatio,
          );
        }

        final item = items[index];
        return ProductCard(
          item: item,
          imageHeight: imageHeight,
          width: itemWidth,
          height: itemWidth / aspectRatio,
          onViewDetails: () {
            // TODO: Implement product details navigation
          },
        );
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width > 1200) return 4;
    if (width > 900) return 3;
    if (width > 600) return 2;
    return 2;
  }

  double _getAspectRatio(double width) {
    if (width > 1200) return 0.85;
    if (width > 900) return 0.8;
    if (width > 600) return 0.75;
    return 0.7;
  }
}
