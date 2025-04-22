import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_palette.dart';
import 'package:test_task/core/widgets/loader.dart';
import 'package:test_task/features/product/domain/entities/product.dart';

class ProductCardView extends StatelessWidget {
  final Product product;
  const ProductCardView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPalette.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(top: 20, bottom: 12, right: 12, left: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Image.network(
              product.thumbnail,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Loader();
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  product.category,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppPalette.subtitleText,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                width: 22,
                child: Icon(
                  Icons.star,
                  size: 16,
                  color: AppPalette.ratingColor,
                ),
              ),
              Text(
                product.rating.toString().substring(0, 3),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.clip,
                ),
                maxLines: 1,
              ),
            ],
          ),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 16,
              color: AppPalette.titleText,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          Spacer(),
          Text(
            '\$${product.price.toString()}',
            style: const TextStyle(
              fontSize: 20,
              color: AppPalette.accentColor,
              fontWeight: FontWeight.w800,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
