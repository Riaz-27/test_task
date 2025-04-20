import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_task/features/product/presentation/pages/product_details_page.dart';
import 'package:test_task/features/product/presentation/pages/product_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/products', page: () => ProductPage()),
    GetPage(name: '/product-details', page: () => ProductDetailsPage()),
  ];
}
