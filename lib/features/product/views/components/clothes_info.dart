import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/widgets/text_utils.dart';
import '../../../favorites/controllers/favorites_controller.dart';
import '../../models/product_models.dart';

class ClothesInfo extends GetView<FavoriteController> {
  final ProductModels product;

  const ClothesInfo({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () => controller.manageFavourites(product),
                    child: controller.isFavourites(product.id)
                        ? const Icon(Icons.favorite,
                            color: Colors.red, size: 20)
                        : const Icon(Icons.favorite_outline,
                            color: Colors.black, size: 20),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                text: "${product.rating.rate}",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                initialRating: product.rating.rate,
                itemBuilder: (context, _) => const Icon(Icons.star,
                    size: 20, color: Colors.orangeAccent),
                itemCount: 5,
                // spacing: 1,
                itemSize: 20,
                ignoreGestures: true,
                allowHalfRating: true,
                onRatingUpdate: (double value) {
                  //   isIndictor.value = true;
                },
                // color: Colors.orangeAccent,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ReadMoreText(
            product.description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.theme.colorScheme.primary,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.theme.colorScheme.primary,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
