import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_ui/blocs/cart/cart_cubit.dart';
import 'products_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'product_details_screen.dart';
import 'blocs/view/view_cubit.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    final List captions = [
      "New Combo Meal",
      "Special Offer ",
      "Limited Time Deal ",
      "New Arrival",
    ];
    return Container(
      color: const Color.fromARGB(255, 250, 250, 250),
      child: Center(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 252, 237, 238),
                  prefixIcon: Icon(Icons.search_rounded, color: Colors.red),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Search for food',
                ),
              ),
            ),
            SizedBox(height: 20),

            // cursor slider
            CarouselSlider(
              options: CarouselOptions(
                height: 240,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [1, 2, 3, 4].map((i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/food$i.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8),
                        child: Text(
                          captions[i - 1],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            // Divider
            SizedBox(height: 20),
            Container(
              height: 55,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  // List View Button
                  Expanded(
                    child: BlocBuilder<ViewCubit, bool>(
                      builder: (context, isListSelected) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ViewCubit>().toggleView(true);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isListSelected
                                  ? Colors.red
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "List View",
                              style: TextStyle(
                                color: isListSelected
                                    ? Colors.white
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Grid View Button
                  Expanded(
                    child: BlocBuilder<ViewCubit, bool>(
                      builder: (context, isListSelected) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ViewCubit>().toggleView(false);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: !isListSelected
                                  ? Colors.red
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "Grid View",
                              style: TextStyle(
                                color: !isListSelected
                                    ? Colors.white
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16),
                Text(
                  "Featured Items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),

            Expanded(
              child: BlocBuilder<ViewCubit, bool>(
                builder: (context, isListSelected) {
                  if (!isListSelected) {
                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: ProductsModel.productItems.length,
                      itemBuilder: (context, index) {
                        final item = ProductsModel.productItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  product: ProductsModel.productItems[index],
                                ),
                              ),
                            );
                          },
                          child: _buildProductGridView(item),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: ProductsModel.productItems.length,
                      itemBuilder: (context, index) {
                        final item = ProductsModel.productItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  product: ProductsModel.productItems[index],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: _buildProductListView(item),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductListView(item) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(item.image, fit: BoxFit.cover),
        ),

        title: Text(
          item.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.1,
          ),
        ),
        subtitle: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          item.desc,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
        ),

        trailing: TextButton(
          onPressed: () {
            context.read<CartCubit>().addItem(item);
          },
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 252, 237, 238),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            "Add to Cart",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 15,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductGridView(ProductsModel item) {
    return Container(
      height: 205,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          // image
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 140,
                height: 140,
                child: Image.asset(item.image, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 5),
          // text
          Text(
            item.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.1,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              item.desc,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
            ),
          ),

          // button
          TextButton(
            onPressed: () {
              context.read<CartCubit>().addItem(item);
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 252, 237, 238),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
