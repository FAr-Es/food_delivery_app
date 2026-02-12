import 'package:flutter/material.dart';
import 'products_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get subtotal {
    double total = 0;
    for (var product in ProductsModel.productItems) {
      total += product.price * product.quantity;
    }
    return total;
  }

  double get taxes => subtotal * 0.1;
  double get deliveryFee => subtotal == 0 ? 0 : 5.0;
  double get total => subtotal + taxes + deliveryFee;

  @override
  Widget build(BuildContext context) {
    final cartItems = ProductsModel.productItems
        .where((product) => product.quantity > 0)
        .toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                "Cart",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: cartItems.isEmpty
                    ? const Center(
                        child: Text(
                          "Your cart is empty",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return _buildItem(cartItems[index]);
                        },
                      ),
              ),

              Divider(thickness: 1),

              _buildPriceRow("Subtotal:", subtotal),
              _buildPriceRow("Delivery Fee:", deliveryFee),
              _buildPriceRow("Taxes (10%):", taxes),

              Divider(thickness: 1),

              _buildPriceRow("Total:", total, isBold: true),

              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Check Out",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height:20),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildItem(ProductsModel product) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          product.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        product.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "\$${product.price.toStringAsFixed(2)}",
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              setState(() {
                product.quantity--;
              });
            },
          ),
          Text(
            product.quantity.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              setState(() {
                product.quantity++;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String title, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
