import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';
import 'package:nawel/presentation/screens/widgets/primary_button.dart';
import 'package:nawel/presentation/screens/widgets/shimmer_loading.dart';

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> item;
  final double imageHeight;
  final double width;
  final double height;
  final VoidCallback onViewDetails;

  const ProductCard({
    super.key,
    required this.item,
    required this.imageHeight,
    required this.width,
    required this.height,
    this.onViewDetails = _defaultOnViewDetails,
  });

  static void _defaultOnViewDetails() {
    // Default empty implementation
  }

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isImageLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputFillGrey,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_buildProductImage(), _buildProductDetails()],
            ),
          ),
          _buildViewDetailsButton(),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Stack(
        children: [
          if (_isImageLoading)
            ShimmerLoading(
              width: double.infinity,
              height: widget.imageHeight,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
          Image.network(
            widget.item['image'],
            height: widget.imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                _isImageLoading = false;
                return child;
              }
              _isImageLoading = true;
              return ShimmerLoading(
                width: double.infinity,
                height: widget.imageHeight,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
              );
            },
            errorBuilder:
                (context, error, stackTrace) => SizedBox(
                  height: widget.imageHeight,
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 40),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.item['name'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.primaryPurple,
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (widget.item['description'] != null) ...[
              const SizedBox(height: 6),
              Text(
                widget.item['description'],
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.iconGrey,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const Spacer(),
            _buildPriceAndRating(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.item['price']} EGP',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.orange,
            fontSize: 16,
            height: 1.2,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.star, color: AppColors.orange, size: 20),
            const SizedBox(width: 4),
            Text(
              '${widget.item['rating'] ?? '-'}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.orange,
                fontSize: 16,
                height: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildViewDetailsButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: SizedBox(
        height: 50,
        child: PrimaryButton(
          text: 'View Details',
          onPressed: widget.onViewDetails,
        ),
      ),
    );
  }
}
