class ProductModel {
  final int id;
  final String name;
  final double salePrice;
  final double mrp;
  final bool isActive;
  final List<String>? images;
  final double rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.salePrice,
    required this.mrp,
    required this.isActive,
    required this.images,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "Unknown Product",
      salePrice:
          (json['sale_price'] != null) ? json['sale_price'].toDouble() : 0.0,
      mrp: (json['mrp'] != null) ? json['mrp'].toDouble() : 0.0,
      isActive: json['is_active'] ?? false,
      images: List<String>.from(json['images']),
      rating:
          (json['avg_rating'] != null) ? json['avg_rating'].toDouble() : 0.0,
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sale_price': salePrice,
      'mrp': mrp,
      'is_active': isActive,
      'images': images,
      'avg_rating': rating,
    };
  }

  // Factory method to create a List of Products from JSON List
  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
