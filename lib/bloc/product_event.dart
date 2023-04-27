part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class ProductLoadedEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}
