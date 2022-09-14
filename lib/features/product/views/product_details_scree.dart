import 'package:flutter/material.dart';

import '../models/product_models.dart';
import 'components/add_cart.dart';
import 'components/clothes_info.dart';
import 'components/image_sliders.dart';
import 'components/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  const ProductDetailsScreen({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ImageSliders(product: productModels),
            ClothesInfo(product: productModels),
            const SizeList(),
            AddCart(
              price: productModels.price,
              productModels: productModels,
            ),
          ],
        ),
      ),
    );
  }
}
