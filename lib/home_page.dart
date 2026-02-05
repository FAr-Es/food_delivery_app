import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'products_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List captions = [
      "New Combo Meal",
      "Special Offer ",
      "Limited Time Deal ",
      "New Arrival",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Delivery',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
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
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 30,
                ),
                height: 3,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 208, 210),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
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

              // Grid view
              Expanded(
                child: GridView.builder(
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
                    return _buildProductItem(item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 13,
          selectedFontSize: 13,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

Widget _buildProductItem(ProductsModel item) {
  return Container(
    height: 200,
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

        Text(
          item.desc,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
        ),

        // button
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 252, 237, 238),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            "Add to Cart",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    ),
  );
}
