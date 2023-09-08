import 'package:flutter/material.dart';
import 'package:untitled/models/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  final VoidCallback press;
  final double height;

  const ProductCard({Key? key, required this.product, required this.press, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: height),
        decoration: const BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.title!,
              child: Image.asset(product.image!),
            ),
            const Text(
              "\$3.99",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.title!,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              "Category",
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
