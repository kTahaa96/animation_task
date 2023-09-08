import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled/assets.dart';
import 'package:untitled/controllers/home_controller.dart';
import 'package:untitled/models/Product.dart';
import 'package:untitled/screens/deatils/details_screen.dart';
import 'package:untitled/screens/home/components/product_card.dart';

class HomeGridView extends StatefulWidget {
  final HomeController controller;

  const HomeGridView({super.key, required this.controller});

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: AssetsList.demo_products.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      itemBuilder: (context, index) => ProductCard(
        height: index.isEven ? 6 : 12,
        product: AssetsList.demo_products[index],
        press: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              reverseTransitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation1, animation2) => FadeTransition(
                opacity: animation1,
                child: DetailsScreen(
                  product: AssetsList.demo_products[index],
                  onProductAdd: () {
                    widget.controller.addProductToCart(AssetsList.demo_products[index]);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
