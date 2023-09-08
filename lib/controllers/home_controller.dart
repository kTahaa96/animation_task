import 'package:flutter/material.dart';
import 'package:untitled/models/Product.dart';
import 'package:untitled/models/ProductItem.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    if (!cart.contains(product.title)) {
      cart.add(ProductItem(product: product));
      notifyListeners();
    }
  }

}
