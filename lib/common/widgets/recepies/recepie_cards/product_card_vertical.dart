import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/recepies/favourite_icon/favourite_icon.dart';
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
import '../../texts/t_brand_title_text_with_verified_icon.dart';


class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, });

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
                      imageUrl: TImages.recepieImage1,
                      applyImageRadius: true,
                    ),
                  ),

                  //fav icon button
                   Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),
            //details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //product name
                    const TProductTitleText(title: "Alisha's Brownie", smallSize: false),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    //brand name
                    TBrandTitleWithVerifiedIcon(title: "Alisha Kabir", textColor: dark ? TColors.light : TColors.dark),
                  ],
                ),
              ),
            ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '50 Mins',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),

                        // add to cart button
                        // ProductcardAddToCartButton(product:product),

                      ],
                    ),
                  // ],
              // ),
            );
  }
}

