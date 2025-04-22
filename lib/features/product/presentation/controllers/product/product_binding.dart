import 'package:get/get.dart';
import 'package:test_task/features/product/data/repositories/product_repository_impl.dart';
import 'package:test_task/features/product/domain/usecases/fetch_all_categories.dart';
import 'package:test_task/features/product/domain/usecases/fetch_products_by_category.dart';
import 'package:test_task/features/product/domain/usecases/get_all_products.dart';
import 'package:test_task/features/product/domain/usecases/search_products_by_title.dart';
import 'package:test_task/features/product/presentation/controllers/product/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAllProducts(Get.find<ProductRepositoryImpl>()));
    Get.lazyPut(() => FetchAllCategories(Get.find<ProductRepositoryImpl>()));
    Get.lazyPut(
      () => FetchProductsByCategory(Get.find<ProductRepositoryImpl>()),
    );
    Get.lazyPut(() => SearchProductsByTitle(Get.find<ProductRepositoryImpl>()));

    Get.lazyPut(
      () => ProductController(Get.find(), Get.find(), Get.find(), Get.find()),
    );
  }
}
