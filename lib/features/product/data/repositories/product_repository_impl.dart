import 'package:test_task/features/product/data/datasources/product_remote_data_source.dart';
import 'package:test_task/features/product/domain/entities/category.dart';
import 'package:test_task/features/product/domain/entities/product.dart';
import 'package:test_task/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<List<Product>> getAllProducts() async {
    final products = await productRemoteDataSource.getAllProducts();
    return products;
  }

  @override
  Future<List<Category>> fetchAllCategories() async {
    final categories = await productRemoteDataSource.fetchAllCategories();
    final cat = Category(slug: 'all', name: 'All', url: '');
    final finalCategories = [cat] + categories;
    return finalCategories;
  }

  @override
  Future<List<Product>> fetchProductsByCategory({
    required String categoryName,
  }) async {
    var products = <Product>[];
    if (categoryName == 'all') {
      products = await productRemoteDataSource.getAllProducts();
    } else {
      products = await productRemoteDataSource.fetchProductsByCategory(
        categoryName: categoryName,
      );
    }
    return products;
  }

  @override
  Future<List<Product>> searchProductsByTitle({
    required String productTitle,
  }) async {
    final products = await productRemoteDataSource.searchProductsByTitle(
      productTitle: productTitle,
    );
    return products;
  }
}
