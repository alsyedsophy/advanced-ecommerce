import 'package:advanced_ecommerce/controllers/cart/cart_state.dart';
import 'package:advanced_ecommerce/core/locator.dart';
import 'package:advanced_ecommerce/models/cart_model.dart';
import 'package:advanced_ecommerce/services/cart_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CatrInit());
  final CartService _cartService = locator<CartService>();

  Future<void> addToCart(CartModel cartModel) async {
    emit(CatrLoading());
    try {
      await _cartService.addToCart(cartModel);
      emit(CatrSuccess(message: "Added To Cart"));
    } catch (e) {
      emit(CatrError(message: e.toString()));
    }
  }

  Future<void> deleteToCart(CartModel cartModel) async {
    emit(CatrLoading());
    try {
      await _cartService.deleteFromCart(cartModel);
      emit(CatrSuccess(message: "Added To Cart"));
    } catch (e) {
      emit(CatrError(message: e.toString()));
    }
  }

  // stream to get cart item

  Stream<List<CartModel>> getCartItem() {
    emit(CatrLoading());
    return _cartService.getCart();
  }
}
