import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_ui/blocs/navigation/navigation_cubit.dart';
import 'products_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [HomeContent(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: state == 1
              ? null
              : AppBar(
                  backgroundColor: const Color.fromARGB(255, 250, 250, 250),
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
                      onPressed: () {
                        context.read<NavigationCubit>().changeTab(1);
                      },
                    ),
                  ],
                ),

          body: _pages[state],

          bottomNavigationBar: SizedBox(
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 13,
              selectedFontSize: 13,
              currentIndex: state,

              onTap: (index) {
                context.read<NavigationCubit>().changeTab(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
