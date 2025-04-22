import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/theme/app_palette.dart';
import 'package:test_task/features/product/domain/entities/product.dart';
import 'package:test_task/features/product/presentation/widgets/custom_back_button.dart';
import 'package:test_task/features/product/presentation/widgets/custom_carousel_view.dart';
import 'package:test_task/features/product/presentation/widgets/custom_floating_action.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product selectedProduct = Get.arguments;
    return Scaffold(
      floatingActionButton: CustomFloatingAction(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CustomBackButton(),
            ),
            CarouselSlider.builder(
              itemCount: selectedProduct.images.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                autoPlay: true,
                viewportFraction: selectedProduct.images.length == 1 ? 1 : 0.9,
                padEnds: false,
              ),
              itemBuilder: (context, index, realIndex) {
                return CustomCarouselView(
                  product: selectedProduct,
                  index: index,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      selectedProduct.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppPalette.titleText,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    '\$${selectedProduct.price.toString()}',
                    maxLines: 2,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppPalette.accentColor,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: AppPalette.ratingColor, size: 20),
                  Text(
                    selectedProduct.rating.toString(),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppPalette.bodyText,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    ' (${selectedProduct.reviews.length.toString()} reviews)',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppPalette.subtitleText,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                selectedProduct.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: AppPalette.bodyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
