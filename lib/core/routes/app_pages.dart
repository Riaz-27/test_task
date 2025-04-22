import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_task/features/product/presentation/controllers/product/product_binding.dart';
import 'package:test_task/features/product/presentation/pages/product_details_page.dart';
import 'package:test_task/features/product/presentation/pages/product_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.product,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(name: AppRoutes.productDetails, page: () => ProductDetailsPage()),
  ];
}
