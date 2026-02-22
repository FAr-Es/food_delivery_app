import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_ui/blocs/cart/cart_cubit.dart';
import 'products_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 250, 250, 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Container(
                height: 250,
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                  ),

                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardDetails(Icons.star, Colors.amber, "4.8", "128 reviews"),
                  cardDetails(Icons.access_time, Colors.red, "20", "MINS"),
                  cardDetails(
                    Icons.local_fire_department,
                    Colors.red,
                    "500",
                    "KCAL",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  widget.product.desc,
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: widget.product.ingredients
                      .map(
                        (ingredient) =>
                            cardIngredients(ingredient.image, ingredient.name),
                      )
                      .toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        context.read<CartCubit>().addItem(widget.product);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardDetails(icon, iconColor, text, subtext) {
  return Container(
    height: 120,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Icon(icon, size: 35, color: iconColor),
        Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
          subtext,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
        ),
      ],
    ),
  );
}

Widget cardIngredients(image, text) {
  return Container(
    height: 50,
    width: 110,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Image.asset(image, height: 20),
        Text(text, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
