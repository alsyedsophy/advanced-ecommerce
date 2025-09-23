class DelivaryModel {
  final String id;
  final String name;
  final String imageUrl;
  final String days;
  final int price;

  DelivaryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.days,
    required this.price,
  });

  factory DelivaryModel.fromMap(Map<String, dynamic> map, String documentId) {
    return DelivaryModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      days: map['days'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'days': days,
      'price': price,
    };
  }
}
