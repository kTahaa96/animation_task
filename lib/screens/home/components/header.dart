import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      alignment: Alignment.center,
      color: const Color(0xffF8F6F1),
      padding: const EdgeInsets.all(16),
      child: const Text(
        "Animation Test",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
    );
  }
}
