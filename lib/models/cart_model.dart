class CartModel {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final int? descountValue;
  final String? category;
  final String size;
  final String color;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.descountValue,
    required this.category,
    required this.size,
    required this.color,
  });

  factory CartModel.fromMap(Map<String, dynamic> data, String productId) {
    return CartModel(
      id: productId,
      title: data["title"],
      price: data["price"],
      imageUrl: data["imageUrl"],
      descountValue: data['descountValue'],
      category: data['category'],
      size: data['size'],
      color: data['color'],
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
      'size': size,
      'color': color,
    };
  }
}
