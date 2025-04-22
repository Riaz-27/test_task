import 'package:test_task/core/usecase/usecase.dart';
import 'package:test_task/features/product/domain/entities/product.dart';
import 'package:test_task/features/product/domain/repositories/product_repository.dart';

class SearchProductsByTitle implements Usecase<List<Product>, String> {
  final ProductRepository productRepository;

  SearchProductsByTitle(this.productRepository);

  @override
  Future<List<Product>> call(String params) async {
    return await productRepository.searchProductsByTitle(productTitle: params);
  }
}
