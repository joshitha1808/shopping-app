import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/global_vairable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "My Cart",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 35,
              //backgroundColor: Colors.amber,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Are you sure want to delete the product',
                      ),
                      actions: [
                        TextButton(onPressed: () {}, child: Text('No')),
                        TextButton(onPressed: () {}, child: Text('Yes')),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: const Color.fromARGB(255, 236, 72, 60),
              ),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'size:${cartItem['size']}',
              style: TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
