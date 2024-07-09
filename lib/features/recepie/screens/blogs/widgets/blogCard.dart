import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/styles/shadow_styles.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/recepies/favourite_icon/favourite_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BlogsCard extends StatelessWidget {
  const BlogsCard({super.key, required this.blog});

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 360,
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
              height: 150,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F),
              child: Stack(
                children: [
                  //thumbnail image
                  Center(
                    child: TRoundedImage(
                      width: 300,
                      fit: BoxFit.cover,
                      imageUrl: blog.image!.toString(),
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  //fav icon button
                  /*Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(recipeId: recipe.id,),
                  ),*/
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
                    TProductTitleText(title: blog.title, smallSize: false),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    //author name
                    TBrandTitleWithVerifiedIcon(title: "by ${blog.author}", textColor: dark ? TColors.light : TColors.dark),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    //content
                    TBrandTitleWithVerifiedIcon(title: blog.content, textColor: dark ? TColors.light : TColors.dark),
                  ],
                ),
              ),
            ),

            // const Spacer(),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Text(
            //         "recipe.time",
            //         style: Theme.of(context).textTheme.headlineMedium,
            //       ),
            //     ),
            //   ],
            // ),

            // add to cart button
            // ProductcardAddToCartButton(product:product),

          ],
        ),
        // ],
        // ),
      ),
    );
  }
}
