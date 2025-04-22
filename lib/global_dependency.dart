import 'package:get/get.dart';
import 'package:test_task/features/product/data/datasources/product_remote_data_source.dart';
import 'package:test_task/features/product/data/repositories/product_repository_impl.dart';

class GlobalDependency {
  static init() {
    Get.lazyPut(() => ProductRemoteDataSourceImpl());
    Get.lazyPut(
      () => ProductRepositoryImpl(Get.find<ProductRemoteDataSourceImpl>()),
    );
  }
}
