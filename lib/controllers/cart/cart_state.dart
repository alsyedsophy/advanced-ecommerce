import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CatrInit extends CartState {}

class CatrLoading extends CartState {}

class CatrSuccess extends CartState {
  final String message;

  CatrSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class CatrError extends CartState {
  final String message;

  CatrError({required this.message});
  @override
  List<Object?> get props => [message];
}
