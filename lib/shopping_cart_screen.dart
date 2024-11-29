import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_bloc.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }
          return ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final product = state.cartItems[index];
              return Card(
                child: ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveItem(product));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
