import 'package:equatable/equatable.dart';

class ShippingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShippingInit extends ShippingState {}

class ShippingLoading extends ShippingState {}

class ShippingSuccess extends ShippingState {
  final String message;

  ShippingSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class ShippingError extends ShippingState {
  final String message;

  ShippingError({required this.message});
  @override
  List<Object?> get props => [message];
}
