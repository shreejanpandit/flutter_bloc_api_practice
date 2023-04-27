// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  List<Product> productModel;
  ProductLoadedState({
    required this.productModel,
  });
  @override
  List<Object?> get props => [productModel];
}

class ProductErrorState extends ProductState {
  final String errorMessage;
  ProductErrorState({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}
