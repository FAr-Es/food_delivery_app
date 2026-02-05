
class ProductsModel {
  String image;
  String name;
  String desc;

  ProductsModel({
    required this.image,
    required this.name,
    required this.desc,
  });

  static List<ProductsModel>  productItems = [

      ProductsModel(
        image: 'assets/images/food1.png',
        name: 'Burger',
        desc: 'Juicy beef burger ',
      ),
      ProductsModel(
        image: 'assets/images/food2.png',
        name: 'Pizza',
        desc: 'Delicious cheese pizza ',
      ),
      ProductsModel(
        image: 'assets/images/food3.png',
        name: 'Sushi',
        desc: 'Fresh sushi rolls ',
      ),
      ProductsModel(
        image: 'assets/images/food4.png',
        name: 'Pasta',
        desc: 'Creamy pasta ',
      ),

  ];
}