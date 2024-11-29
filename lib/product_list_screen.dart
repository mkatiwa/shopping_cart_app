import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_bloc.dart';
import 'shopping_cart_screen.dart';
import 'product.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Product 1', price: 10.0, imageUrl: 'https://via.placeholder.com/150'),
    Product(name: 'Product 2', price: 20.0, imageUrl: 'https://via.placeholder.com/150'),
    Product(name: 'Product 3', price: 30.0, imageUrl: 'https://via.placeholder.com/150'),
  ];

ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.read<CartBloc>().add(AddItem(product));
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShoppingCartScreen()),
          );
        },
      ),
    );
  }
}
