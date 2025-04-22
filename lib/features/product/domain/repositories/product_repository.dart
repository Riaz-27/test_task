import 'package:test_task/features/product/domain/entities/category.dart';
import 'package:test_task/features/product/domain/entities/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<List<Category>> fetchAllCategories();
  Future<List<Product>> fetchProductsByCategory({required String categoryName});
  Future<List<Product>> searchProductsByTitle({required String productTitle});
}
