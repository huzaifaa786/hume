import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/views/layout/layout_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBarTitle: 'New arrivals',
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ProductCard(),
                ProductCard(),
              ],
            ),
            Row(
              children: [
                ProductCard(),
                ProductCard(),
              ],
            ),
            Row(
              children: [
                ProductCard(),
                ProductCard(),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
