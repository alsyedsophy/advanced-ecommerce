import 'dart:developer';

import 'package:advanced_ecommerce/controllers/product/product_state.dart';
import 'package:advanced_ecommerce/models/product.dart';
import 'package:advanced_ecommerce/services/firestore_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInit());

  final _firestore = FirestoreService.instance;

  // دالة تحميل كل البيانات مرة واحدة
  Future<void> loadAllProducts() async {
    emit(ProductLoading());
    try {
      // يمكنك إضافة أي تحميل ابتدائي هنا إذا needed
      await Future.delayed(Duration(milliseconds: 300));
      emit(ProductSuccess(message: "Success To load"));
    } catch (e) {
      emit(ProductError(error: 'Failed to load products: ${e.toString()}'));
    }
  }

  // Set Product
  Future<void> setProduct(String path, Product product) async {
    emit(ProductLoading());
    try {
      await _firestore.setData(path: path, data: product.toMap());
      emit(ProductSuccess(message: "${product.title} Added Successfully"));
    } catch (e) {
      log(e.toString());
      emit(ProductError(error: e.toString()));
    }
  }

  // delete Product
  Future<void> deleteProduct(String path) async {
    emit(ProductLoading());
    try {
      await _firestore.deleteData(path: path);
      emit(ProductSuccess(message: "Delete Successfully"));
    } catch (e) {
      log(e.toString());
      emit(ProductError(error: e.toString()));
    }
  }

  // Get all Documents in Collection
  Stream<List<Product>> getAllProductStream() {
    return _firestore.collectionsStream<Product>(
      path: "products",
      builder: (data, documentId) => Product.fromMap(data ?? {}, documentId),
    );
  }

  // Get All Products Have A Dscount
  Stream<List<Product>> getDescountProductStream() {
    return _firestore.collectionsStream<Product>(
      path: "products",
      builder: (data, documentId) => Product.fromMap(data ?? {}, documentId),
      queryBuilder: (query) => query.where('descountValue', isNotEqualTo: 0),
    );
  }

  // Get All Data and Collections in Document
  Stream<Product> getByDocument(String documentId) {
    return _firestore.documintStream(
      path: "path/$documentId",
      builder: (data, documentId) => Product.fromMap(data ?? {}, documentId),
    );
  }
}
