class ProductsModel {
  String image;
  String name;
  String desc;
  double price;
  List<Ingredient> ingredients;
  int quantity;

  ProductsModel({
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
    required this.ingredients,
    this.quantity = 0,
  });

  static List<ProductsModel> productItems = [
    ProductsModel(
      image: 'assets/images/food1.png',
      name: 'Beef Burger',
      desc:
          'Juicy beef burger with a perfectly grilled beef patty, fresh lettuce, ripe tomatoes, and melted cheese, served on a toasted sesame bun. A classic favorite that satisfies your hunger and taste buds.',
      price: 9.99,
      ingredients: [
        Ingredient(
          name: 'Beef Patty',
          image: 'assets/images/ingredients/beef.png',
        ),
        Ingredient(
          name: 'Lettuce',
          image: 'assets/images/ingredients/lettuce.png',
        ),
        Ingredient(
          name: 'Tomato',
          image: 'assets/images/ingredients/tomato.png',
        ),
        Ingredient(
          name: 'Cheese',
          image: 'assets/images/ingredients/cheese.png',
        ),
      ],
    ),

    ProductsModel(
      image: 'assets/images/food2.png',
      name: 'Pizza',
      desc:
          'Delicious cheese pizza with a golden crust, rich tomato sauce, and a generous layer of melted cheese topped with pepperoni slices. Perfect for sharing with friends or enjoying on your own.',
      price: 12.99,
      ingredients: [
        Ingredient(name: 'Dough', image: 'assets/images/ingredients/dough.png'),
        Ingredient(name: 'Sauce', image: 'assets/images/ingredients/sauce.png'),
        Ingredient(
          name: 'Cheese',
          image: 'assets/images/ingredients/cheese.png',
        ),
        Ingredient(
          name: 'Pepperoni',
          image: 'assets/images/ingredients/pepperoni.png',
        ),
      ],
    ),

    ProductsModel(
      image: 'assets/images/food3.png',
      name: 'Sushi',
      desc:
          'Fresh sushi rolls made with perfectly seasoned rice, nori seaweed, tender slices of fish, and creamy avocado. Each bite is a delightful combination of flavors and textures from traditional Japanese cuisine.',
      price: 15.99,
      ingredients: [
        Ingredient(name: 'Rice', image: 'assets/images/ingredients/rice.png'),
        Ingredient(name: 'Nori', image: 'assets/images/ingredients/nori.png'),
        Ingredient(name: 'Fish', image: 'assets/images/ingredients/fish.png'),
        Ingredient(
          name: 'Avocado',
          image: 'assets/images/ingredients/avocado.png',
        ),
      ],
    ),

    ProductsModel(
      image: 'assets/images/food4.png',
      name: 'Pasta',
      desc:
          'Creamy pasta cooked to perfection with tender noodles, rich sauce, melted cheese, and fresh basil leaves. A comforting Italian dish that is both satisfying and full of flavor.',
      price: 11.99,
      ingredients: [
        Ingredient(name: 'Pasta', image: 'assets/images/ingredients/pasta.png'),
        Ingredient(name: 'Sauce', image: 'assets/images/ingredients/sauce.png'),
        Ingredient(
          name: 'Cheese',
          image: 'assets/images/ingredients/cheese.png',
        ),
        Ingredient(name: 'Basil', image: 'assets/images/ingredients/basil.png'),
      ],
    ),
  ];
}

class Ingredient {
  String image;
  String name;

  Ingredient({required this.image, required this.name});
}
