import 'package:advanced_ecommerce/utilities/style/app_assets.dart';

class Product {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String? descountValue;
  final String? category;
  final String rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.descountValue,
    this.category = "others",
    required this.rate,
  });
}

List<Product> products = [
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: "30",
    category: "Clothes",
    descountValue: "30",
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: "30",
    category: "Clothes",
    descountValue: "30",
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: "30",
    category: "Clothes",
    descountValue: "30",
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: "30",
    category: "Clothes",
    descountValue: "30",
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: "30",
    category: "Clothes",
    descountValue: "30",
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: "30",
    category: "Clothes",
    descountValue: "30",
  ),
  Product(
    id: "1",
    title: "T-Shert",
    price: "56",
    imageUrl: AppAssets.productImage,
    rate: "30",
    category: "Clothes",
    descountValue: "30",
  ),
];
