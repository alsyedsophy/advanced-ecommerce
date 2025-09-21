import 'dart:developer';

import 'package:advanced_ecommerce/core/locator.dart';
import 'package:advanced_ecommerce/models/cart_model.dart';
import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:advanced_ecommerce/services/firestore_service.dart';

class CartService {
  final AuthService _authService = locator<AuthServiceImpl>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // add to cart
  Future<void> addToCart(CartModel cartModel) async {
    final uid = _authService.getCurrentUser!.uid;
    try {
      await _firestoreService.setData(
        path: 'users/$uid/carts/${cartModel.id}',
        data: cartModel.toMap(),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // delete to cart
  Future<void> deleteFromCart(CartModel cartModel) async {
    final uid = _authService.getCurrentUser!.uid;
    try {
      await _firestoreService.setData(
        path: 'users/$uid/carts/${cartModel.id}',
        data: cartModel.toMap(),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<List<CartModel>> getCart() {
    final uid = _authService.getCurrentUser!.uid;
    try {
      return _firestoreService.collectionsStream(
        path: 'users/$uid/carts',
        builder: (data, documintId) => CartModel.fromMap(data!, documintId),
      );
    } catch (e) {
      log('List Cart of Model Error : ${e.toString()}');
      rethrow;
    }
  }
}
