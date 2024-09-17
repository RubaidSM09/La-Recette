import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/shadow_styles.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/admin_blog_details.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/admin_recipe_details.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/pending_blog.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/pending_recipe.dart';
import 'package:t_store/features/recepie/controllers/blog_controller.dart';
import 'package:t_store/features/recepie/controllers/notifications_controller.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';
import 'package:t_store/features/recepie/models/notifications_model.dart';
import 'package:t_store/features/recepie/screens/blogs/blog_details_page.dart';
import 'package:t_store/features/recepie/screens/recipe_details/recipe_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NotificationsCard extends StatelessWidget {
  NotificationsCard({super.key, required this.notifications});

  final NotificationsModel notifications;
  final blogController = BlogController.instance;
  final controller=NotificationsController.instance;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        if(notifications.isVisited==false){
          controller.updateAfterVisiting(notifications);
        }
        if(notifications.type == "Recipe Upload"){
          Get.to(() => RecipePage(recipeId: notifications.path.toString(),));
        }
        else if(notifications.type == "Blog Upload"){
          Get.to(() => BlogDetailsPage(blogId: notifications.path.toString()));
        }
        else if(notifications.type == "Recipe Pending"){
          Get.to(() => const AdminPendingRecipeList());
        }
        else if(notifications.type == "Blog Pending"){
          Get.to(() => const AdminPendingBlogList());
        }
      },
      child: Column(
        children: [
          Container(
            height: 90,
            width: 361,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [TShadowStyle.verticalProductShadow],
              borderRadius: BorderRadius.circular(0),
              border: Border(
                bottom: BorderSide(width: 5,color: dark ? TColors.dark : const Color(0xFFE85A4F)),
              ),
              color: notifications.isVisited! ? dark ? TColors.light : TColors.dark : dark ? TColors.dark : const Color(0xFFE85A4F),
            ),
            child: Row(
              children: [
                //thumbnail,wishlist button and discount tag
                Center(
                        child: TRoundedImage(
                          width: 75,
                          height: 75,
                          fit: BoxFit.cover,
                          imageUrl: notifications.image,
                          applyImageRadius: true,
                          isNetworkImage: true,
                        ),
                      ),

                const SizedBox(width: TSizes.spaceBtwItems / 2),
                //details
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: SizedBox(
                    width: 250,
                    child: TBrandTitleWithVerifiedIcon(title: notifications.title, textColor: notifications.isVisited! ? dark ? TColors.dark : const Color(0xFFE85A4F) : dark ? TColors.light : TColors.dark, brandTextSize: TextSizes.large, maxLines: 3,),
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
          // const SizedBox(height: 5,)
        ],
      ),
    );
  }
}
