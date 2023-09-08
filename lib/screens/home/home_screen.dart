import 'package:flutter/material.dart';
import 'package:untitled/controllers/home_controller.dart';
import 'package:untitled/screens/home/components/home_grid.dart';

import 'components/cart_details_view.dart';
import 'components/cart_short_view.dart';
import 'components/header.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(seconds: 1),
                          top: controller.homeState == HomeState.normal
                              ? 85
                              : -(constraints.maxHeight - 100 * 2 - 85),
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight - 85 - 100,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xffF8F6F1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: HomeGridView(
                              controller: controller,
                            ),
                          ),
                        ),
                        // Card Panel
                        AnimatedPositioned(
                          duration: const Duration(seconds: 1),
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: controller.homeState == HomeState.normal
                              ? 100
                              : (constraints.maxHeight - 100),
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              color: Colors.black,
                              alignment: Alignment.topLeft,
                              child: AnimatedSwitcher(
                                duration: const Duration(seconds: 1),
                                child: controller.homeState == HomeState.normal
                                    ? CardShortView(controller: controller)
                                    : CartDetailsView(controller: controller),
                              ),
                            ),
                          ),
                        ),
                        // Header
                        AnimatedPositioned(
                          duration: const Duration(seconds: 1),
                          top: controller.homeState == HomeState.normal ? 0 : -85,
                          right: 0,
                          left: 0,
                          height: 85,
                          child: const HomeHeader(),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
