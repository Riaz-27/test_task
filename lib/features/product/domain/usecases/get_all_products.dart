import 'package:test_task/core/usecase/usecase.dart';
import 'package:test_task/features/product/domain/entities/product.dart';
import 'package:test_task/features/product/domain/repositories/product_repository.dart';

class GetAllProducts implements Usecase<List<Product>, NoParams> {
  final ProductRepository productRepository;

  GetAllProducts(this.productRepository);

  @override
  Future<List<Product>> call(NoParams params) async {
    return await productRepository.getAllProducts();
  }
}
