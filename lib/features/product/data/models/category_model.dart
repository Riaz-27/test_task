import 'package:test_task/features/product/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({required super.slug, required super.name, required super.url});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'slug': slug, 'name': name, 'url': url};
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      slug: map['slug'] ?? '',
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  CategoryModel copyWith({String? slug, String? name, String? url}) {
    return CategoryModel(
      slug: slug ?? this.slug,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
