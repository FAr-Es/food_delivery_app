import 'package:flutter/material.dart';
import 'package:food_app_ui/blocs/cart/cart_cubit.dart';
import 'package:food_app_ui/blocs/navigation/navigation_cubit.dart';
import 'package:food_app_ui/blocs/view/view_cubit.dart';
import 'home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ViewCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery App',
        home: HomePage(),
      ),
    );
  }
}
