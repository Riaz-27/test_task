import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/theme/app_palette.dart';
import 'package:test_task/core/widgets/loader.dart';
import 'package:test_task/features/product/presentation/controllers/product/product_controller.dart';
import 'package:test_task/core/routes/app_pages.dart';
import 'package:test_task/features/product/presentation/widgets/product_card_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final TextEditingController titleController = TextEditingController();

    final allProducts = productController.products;
    final allCategories = productController.categories;
    final selectedCatIndex = productController.selectedCatIndex;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            child: Text(
              'Find Your\nDream Products',
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 28,
                color: AppPalette.titleText,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
                letterSpacing: 2.5,
              ),
              maxLines: 2,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: titleController,
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                hintText: 'Search products',
                suffixIcon: IconButton(
                  onPressed: () {
                    productController.searchProduct(
                      productTitle: titleController.text,
                    );
                    productController.setCategoryIndex(0);
                  },
                  icon: Icon(CupertinoIcons.search),
                ),
              ),
              onSubmitted: (value) {
                productController.searchProduct(productTitle: value);
                productController.setCategoryIndex(0);
              },
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: Text(
              'Categories',
              style: const TextStyle(
                fontSize: 20,
                letterSpacing: 1.3,
                color: AppPalette.titleText,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allCategories.length,
                itemBuilder: (context, index) {
                  final category = allCategories[index];
                  return Row(
                    children: [
                      index == 0 ? SizedBox(width: 12) : SizedBox(),
                      GestureDetector(
                        onTap: () {
                          titleController.clear();
                          productController.setCategoryIndex(index);
                          productController.filterProducts(
                            categoryName: category.slug,
                          );
                        },
                        child: Obx(() {
                          return Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  index == selectedCatIndex.value
                                      ? AppPalette.activeChipBackground
                                      : AppPalette.inactiveChipBackground,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              category.name,
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    index == selectedCatIndex.value
                                        ? AppPalette.whiteColor
                                        : AppPalette.titleText,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.clip,
                              ),
                              maxLines: 1,
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
          Expanded(
            flex: 12,
            child: Obx(() {
              return productController.isLoading.value
                  ? Loader()
                  : GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: allProducts.length,
                    itemBuilder: (context, index) {
                      final product = allProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.productDetails,
                            arguments: product,
                          );
                        },
                        child: ProductCardView(product: product),
                      );
                    },
                  );
            }),
          ),
        ],
      ),
    );
  }
}
