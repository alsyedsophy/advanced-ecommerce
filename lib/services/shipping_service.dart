import 'dart:developer';

import 'package:advanced_ecommerce/core/locator.dart';
import 'package:advanced_ecommerce/models/shipping_address_model.dart';
import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:advanced_ecommerce/services/firestore_service.dart';

class ShippingService {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthServiceImpl _authService = locator<AuthServiceImpl>();

  Future<void> addShippingAdress(ShippingAddressModel shippingModel) async {
    final uid = _authService.getCurrentUser!.uid;
    try {
      await _firestoreService.setData(
        path: 'users/$uid/shipping/${shippingModel.id}',
        data: shippingModel.toMap(),
      );
    } catch (e) {
      log('Error in Shipping Service');
      rethrow;
    }
  }

  Future<void> deleteShipping(ShippingAddressModel shippingModel) async {
    final uid = _authService.getCurrentUser!.uid;
    try {
      await _firestoreService.deleteData(
        path: 'users/$uid/shipping/${shippingModel.id}',
      );
    } catch (e) {
      log("Error in Shipping Service at delete");
      rethrow;
    }
  }

  Stream<List<ShippingAddressModel>> getShippingAddresses() {
    final uid = _authService.getCurrentUser!.uid;
    try {
      return _firestoreService.collectionsStream(
        path: 'users/$uid/shipping/',
        builder: (data, documintId) =>
            ShippingAddressModel.fromMap(data!, documintId),
      );
    } catch (e) {
      log("Error in shipping service at get shipping");
      rethrow;
    }
  }
}
