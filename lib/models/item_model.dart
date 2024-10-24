class Item {
  final String id;
  final String name;
  final double price;
  final double discountPrice;
  final String description;
  final String imageUrl;
  final double? review;
  final String category;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.description,
    required this.imageUrl,
    this.review,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      review: json['review'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'discountPrice': discountPrice,
      'description': description,
      'imageUrl': imageUrl,
      'review': review,
      'category': category,
    };
  }
}
