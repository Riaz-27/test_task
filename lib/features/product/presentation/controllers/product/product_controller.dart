import 'package:get/get.dart';
import 'package:test_task/core/usecase/usecase.dart';
import 'package:test_task/features/product/domain/entities/category.dart';
import 'package:test_task/features/product/domain/entities/product.dart';
import 'package:test_task/features/product/domain/usecases/fetch_all_categories.dart';
import 'package:test_task/features/product/domain/usecases/fetch_products_by_category.dart';
import 'package:test_task/features/product/domain/usecases/get_all_products.dart';
import 'package:test_task/features/product/domain/usecases/search_products_by_title.dart';

class ProductController extends GetxController {
  final GetAllProducts getAllProducts;
  final FetchAllCategories fetchAllCategories;
  final FetchProductsByCategory fetchProductsByCategory;
  final SearchProductsByTitle searchProductsByTitle;

  ProductController(
    this.getAllProducts,
    this.fetchAllCategories,
    this.fetchProductsByCategory,
    this.searchProductsByTitle,
  );

  var products = <Product>[].obs;
  var categories = <Category>[].obs;
  RxInt selectedCatIndex = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    products.value = await getAllProducts(NoParams());
    categories.value = await fetchAllCategories(NoParams());
    isLoading.value = false;
    super.onInit();
  }

  void filterProducts({required String categoryName}) async {
    isLoading.value = true;
    products.value = await fetchProductsByCategory(categoryName);
    isLoading.value = false;
  }

  void setCategoryIndex(int index) {
    selectedCatIndex.value = index;
  }

  void searchProduct({required String productTitle}) async {
    isLoading.value = true;
    products.value = await searchProductsByTitle(productTitle);
    isLoading.value = false;
  }
}
