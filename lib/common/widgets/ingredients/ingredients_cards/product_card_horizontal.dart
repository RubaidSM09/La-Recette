import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/recepies/favourite_icon/favourite_icon.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/features/recepie/controllers/product/product_controller.dart';
// import 'package:t_store/features/recepie/models/product_model.dart';
import '../../../../utils/helpers/helper_functions.dart';


class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, /* required this.product */});

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // final controller = ProductController.instance;
    // final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return Column(
      children: [
        Container(
          width: 360,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.dark : const Color(0xFFE85A4F),
          ),
          child: Row(
            children: [
              TRoundedContainer(
                height: 60,
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F),
                child: const Stack(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: TRoundedImage(
                        fit: BoxFit.fill,
                        imageUrl: TImages.ingredientImage1,
                        applyImageRadius: true,
                      ),
                    ),
                  ],
                ),
              ),
              //Detail
              const SizedBox(
                width: 60,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: TSizes.sm,
                    left: TSizes.sm,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TProductTitleText(
                            title: 'Eggs',
                            smallSize: false,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 140,
              ),
              TextButton(
                onPressed: () {  },
                child: SizedBox(
                  width: TSizes.iconLg * 1.2,
                  height: TSizes.iconLg * 1.2,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.clear,
                      color: dark ? TColors.light : TColors.dark,
                    ),
                  ),
                ),
              )
            ],
          ),
          // color: Colors.amber,
        ),
        const SizedBox(height: TSizes.spaceBtwItems,)
      ],
    );
  }
}