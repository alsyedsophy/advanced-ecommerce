class Product {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final int? descountValue;
  final String? category;
  final int rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.descountValue,
    this.category = "others",
    required this.rate,
  });

  factory Product.fromMap(Map<String, dynamic> data, String productId) {
    return Product(
      id: productId,
      title: data["title"],
      price: data["price"],
      imageUrl: data["imageUrl"],
      descountValue: data['descountValue'],
      category: data['category'],
      rate: data['rate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'descountValue': descountValue,
      'category': category,
      'rate': rate,
    };
  }
}
