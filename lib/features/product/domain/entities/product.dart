class Product {
  int id;
  String title;
  String description;
  String category;
  double price;
  double rating;
  List<String> images;
  String thumbnail;
  List<Map<String, dynamic>> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.images,
    required this.thumbnail,
    required this.reviews,
  });
}
