import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_ui/products_model.dart';

class CartCubit extends Cubit<List<ProductsModel>> {
  CartCubit() : super([]);

  void addItem(ProductsModel product) {
    product.quantity++;
    emit(List.of(state));
  }

  void decrement(ProductsModel product) {
    if (product.quantity > 0) {
      product.quantity--;
      emit(List.of(state));
    }
  }
}
