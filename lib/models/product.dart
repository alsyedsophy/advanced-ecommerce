import 'package:advanced_ecommerce/utilities/style/app_assets.dart';

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

List<Product> products = [
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: 30,
    category: "Clothes",
    descountValue: 30,
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: 30,
    category: "Clothes",
    descountValue: 30,
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: 30,
    category: "Clothes",
    descountValue: 30,
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: 30,
    category: "Clothes",
    descountValue: 30,
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: 30,
    category: "Clothes",
    descountValue: 30,
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: 30,
    category: "Clothes",
    descountValue: 30,
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: 30,
    category: "Clothes",
    descountValue: 30,
  ),
];
