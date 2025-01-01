class GetProductResponse {
  final String message;
  final List<GetProduct> products;

  GetProductResponse({
    required this.message,
    required this.products,
  });
  factory GetProductResponse.fromJson(Map<String, dynamic> json) {
    return GetProductResponse(
      message: json['message'] as String,
      products: (json['products'] as List<dynamic>)
          .map((product) => GetProduct.fromJson(product as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
class GetProduct {
  final String id;
  final String img;
  final String name;
  final List<String> categories;

  GetProduct({
    required this.id,
    required this.img,
    required this.name,
    required this.categories,
  });

  // Factory method to create an instance from JSON
  factory GetProduct.fromJson(Map<String, dynamic> json) {
    return GetProduct(
      id: json['_id'] as String,
      img: json['img'] as String,
      name: json['name'] as String,
      categories: List<String>.from(json['cat'] as List<dynamic>),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'img': img,
      'name': name,
      'cat': categories,
    };
  }
}
