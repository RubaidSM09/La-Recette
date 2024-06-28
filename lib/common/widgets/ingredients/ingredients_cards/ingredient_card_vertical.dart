import 'package:flutter/material.dart';
// import 'package:t_store/features/recepie/controllers/product/cart_controller.dart';
// import 'package:t_store/features/recepie/controllers/product/product_controller.dart';
// import 'package:t_store/features/recepie/models/product_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadow_styles.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';


class TIngredientCardVertical extends StatelessWidget {
  const TIngredientCardVertical({super.key, });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.dark : const Color(0xFFE85A4F),
        ),
        child: Column(
          children: [
            //thumbnail,wishlist button and discount tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F),
              child: const Stack(
                children: [
                  //thumbnail image
                  Center(
                    child: TRoundedImage(
                      imageUrl: TImages.ingredientImage1,
                      applyImageRadius: true,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),
            //details
            const Padding(
              padding: EdgeInsets.only(left: TSizes.md),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ingredient name
                    TProductTitleText(title: "Egg", smallSize: false),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                  ],
                ),
              ),
            ),
          ],
        ),
                  // ],
              // ),
    );
  }
}

