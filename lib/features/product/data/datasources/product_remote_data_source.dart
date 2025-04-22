import 'dart:convert';

import 'package:test_task/core/constants/server_constant.dart';
import 'package:test_task/features/product/data/models/category_model.dart';
import 'package:test_task/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract interface class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<CategoryModel>> fetchAllCategories();
  Future<List<ProductModel>> fetchProductsByCategory({
    required String categoryName,
  });
  Future<List<ProductModel>> searchProductsByTitle({
    required String productTitle,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final res = await http.get(
        Uri.parse('${ServerConstant.serverUrl}?limit=100'),
      );
      final resBodyMap = jsonDecode(res.body) as Map<String, dynamic>;
      final products = List<Map<String, dynamic>>.from(resBodyMap['products']);

      return products.map((product) => ProductModel.fromJson(product)).toList();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<CategoryModel>> fetchAllCategories() async {
    try {
      final res = await http.get(
        Uri.parse('${ServerConstant.serverUrl}/categories'),
      );
      final resBodyMap = jsonDecode(res.body);
      final categories = List<Map<String, dynamic>>.from(resBodyMap);

      return categories
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<ProductModel>> fetchProductsByCategory({
    required String categoryName,
  }) async {
    try {
      final res = await http.get(
        Uri.parse('${ServerConstant.serverUrl}/category/$categoryName'),
      );
      final resBodyMap = jsonDecode(res.body) as Map<String, dynamic>;
      final products = List<Map<String, dynamic>>.from(resBodyMap['products']);

      return products.map((product) => ProductModel.fromJson(product)).toList();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<ProductModel>> searchProductsByTitle({
    required String productTitle,
  }) async {
    try {
      final res = await http.get(
        Uri.parse('${ServerConstant.serverUrl}/search?q=$productTitle'),
      );
      final resBodyMap = jsonDecode(res.body) as Map<String, dynamic>;
      final products = List<Map<String, dynamic>>.from(resBodyMap['products']);

      return products.map((product) => ProductModel.fromJson(product)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
