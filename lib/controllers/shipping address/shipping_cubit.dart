import 'package:advanced_ecommerce/controllers/shipping%20address/shipping_state.dart';
import 'package:advanced_ecommerce/core/locator.dart';
import 'package:advanced_ecommerce/models/shipping_address_model.dart';
import 'package:advanced_ecommerce/services/shipping_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingCubit extends Cubit<ShippingState> {
  ShippingCubit() : super(ShippingInit());
  final ShippingService _shippingService = locator<ShippingService>();

  Future<void> addShipping(ShippingAddressModel shippingModel) async {
    emit(ShippingLoading());
    try {
      await _shippingService.addShippingAdress(shippingModel);
      emit(ShippingSuccess(message: "Added Successfully"));
    } catch (e) {
      emit(ShippingError(message: "Added Felled"));
    }
  }

  Future<void> deleteShipping(ShippingAddressModel shippingModel) async {
    emit(ShippingLoading());
    try {
      await _shippingService.deleteShipping(shippingModel);
      emit(ShippingSuccess(message: "Delete Successfully"));
    } catch (e) {
      emit(ShippingError(message: "Delete Felled"));
    }
  }

  Stream<List<ShippingAddressModel>> getAllShipping() {
    emit(ShippingLoading());
    return _shippingService.getShippingAddresses();
  }
}
