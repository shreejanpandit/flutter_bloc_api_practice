import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc_api/repositories/product_data_repo/product_repo.dart';

import '../models/product_models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductLoadingState()) {
    on<ProductEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var data = await productRepository.getProducts();
        emit(ProductLoadedState(productModel: data));
      } catch (e) {
        emit(ProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}
