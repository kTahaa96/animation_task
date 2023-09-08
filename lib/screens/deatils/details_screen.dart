import 'package:flutter/material.dart';
import 'package:untitled/assets.dart';
import 'package:untitled/models/Product.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product, required this.onProductAdd})
      : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: InkWell(
              onTap: () {
                widget.onProductAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: Container(
                height: 48,
                margin: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.product.title!),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Hero(
                    tag: widget.product.title! + _cartTag,
                    child: Image.asset(widget.product.image!),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16 * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                // Price(amount: "20.00"),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AssetsList.textContentLong,
              style: const TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

// AppBar buildAppBar() {
//   return AppBar(
//     leading: const BackButton(
//       color: Colors.black,
//     ),
//     backgroundColor: const Color(0xFFF8F8F8),
//     elevation: 0,
//     centerTitle: true,
//     title: const Text(
//       "Fruits",
//       style: TextStyle(color: Colors.black),
//     ),
//   );
// }
}
