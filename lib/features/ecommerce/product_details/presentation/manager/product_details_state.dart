part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsModel productDetailsModel;

  ProductDetailsSuccess({required this.productDetailsModel});
}

class ProductDetailsError extends ProductDetailsState {
  final String error;

  ProductDetailsError({required this.error});
}
