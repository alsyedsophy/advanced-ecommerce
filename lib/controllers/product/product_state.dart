import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInit extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final String message;

  ProductSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class ProductError extends ProductState {
  final String error;

  ProductError({required this.error});
  @override
  List<Object?> get props => [error];
}
