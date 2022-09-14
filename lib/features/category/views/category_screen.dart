import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/text_utils.dart';
import '../controllers/category_controller.dart';
import 'components/category_items.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: TextUtils(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  text: "Category",
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () {
                if (controller.isCatgeoryLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.getCategoryIndex(index);
                            Get.to(() => CategoryItems(
                                categoryTitle:
                                    controller.categoryNameList[index]));
                          },
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    controller.imageCategory[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 10),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  controller.categoryNameList[index],
                                  style: const TextStyle(
                                    backgroundColor: Colors.black38,
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 20),
                      itemCount: controller.categoryNameList.length,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
