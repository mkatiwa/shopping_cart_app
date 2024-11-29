import 'package:flutter_bloc/flutter_bloc.dart';
import 'product.dart';

abstract class CartEvent {}

class AddItem extends CartEvent {
  final Product product;

  AddItem(this.product);
}

class RemoveItem extends CartEvent {
  final Product product;

  RemoveItem(this.product);
}

class ClearCart extends CartEvent {}

class CartState {
  final List<Product> cartItems;

  CartState(this.cartItems);

  double get totalCost =>
      cartItems.fold(0, (total, current) => total + current.price);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddItem>((event, emit) {
      final updatedCart = List<Product>.from(state.cartItems)..add(event.product);
      emit(CartState(updatedCart));
    });

    on<RemoveItem>((event, emit) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..remove(event.product);
      emit(CartState(updatedCart));
    });

    on<ClearCart>((event, emit) {
      emit(CartState([]));
    });
  }
}
