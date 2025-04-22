import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_palette.dart';
import 'package:test_task/core/widgets/loader.dart';
import 'package:test_task/features/product/domain/entities/product.dart';

class CustomCarouselView extends StatelessWidget {
  final Product product;
  final int index;
  const CustomCarouselView({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 20),
          decoration: BoxDecoration(
            color: AppPalette.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: product.images[index],
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) {
              return Loader(value: progress.progress);
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(
          top: 40,
          left: 40,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppPalette.bodyText.withAlpha(140),
            ),
            child: Row(
              children: [
                Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppPalette.whiteColor,
                  ),
                ),
                Text(
                  '/${product.images.length}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppPalette.whiteColor.withAlpha(180),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
