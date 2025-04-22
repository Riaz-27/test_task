import 'package:test_task/core/usecase/usecase.dart';
import 'package:test_task/features/product/domain/entities/category.dart';
import 'package:test_task/features/product/domain/repositories/product_repository.dart';

class FetchAllCategories implements Usecase<List<Category>, NoParams> {
  final ProductRepository productRepository;

  FetchAllCategories(this.productRepository);

  @override
  Future<List<Category>> call(NoParams params) async {
    return await productRepository.fetchAllCategories();
  }
}
