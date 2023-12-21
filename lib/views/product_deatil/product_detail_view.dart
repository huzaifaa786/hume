import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/product_deatil/product_detail_controller.dart';
import 'package:hume/views/product_deatil/top_card.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBarTitle: 'Product details',
      body: Column(
        children: [
          ProductProfileCardCard(
            
          )
        ],
      ),
    );
  }
}
