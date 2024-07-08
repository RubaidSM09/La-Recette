import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/category_shimmer.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/recepie/controllers/category_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(CategoryController());

    return Obx(() {
      if(controller.isLoading.value) return const TCategoryShimmer();

      if(controller.featuredCategories.isEmpty) {
        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final categoryController = controller.featuredCategories[index];
            return TVerticalImageText(
              image: categoryController.image,
              backgroundColor: dark ? TColors.dark : const Color(0xFFE98B80),
              title: categoryController.name,
              onTap: ()=> {},
            );
          },
        ),
      );
    }
    );
  }
}