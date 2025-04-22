import 'package:test_task/features/product/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.rating,
    required super.images,
    required super.thumbnail,
    required super.reviews,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'rating': rating,
      'images': images,
      'thumbnail': thumbnail,
      'reviews': reviews,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price'] ?? 0.0,
      rating: map['rating'] ?? 0.0,
      images: List<String>.from(map['images']),
      thumbnail: map['thumbnail'] ?? '',
      reviews: List<Map<String, dynamic>>.from(map['reviews']),
    );
  }

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? rating,
    List<String>? images,
    String? thumbnail,
    List<Map<String, dynamic>>? reviews,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
      reviews: reviews ?? this.reviews,
    );
  }
}
