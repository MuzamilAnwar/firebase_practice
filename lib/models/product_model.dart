class Product {
  String id;
  String name;
  double price;
  bool isCompleted;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.isCompleted = false,
  });

  // Convert Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'isCompleted': isCompleted,
    };
  }

  // Create a Product object from JSON
  static Product fromJson(Map<String, dynamic> json, String id) {
    return Product(
      id: id,
      name: json['name'],
      price: json['price'],
      isCompleted: json['isCompleted'],
    );
  }
}
