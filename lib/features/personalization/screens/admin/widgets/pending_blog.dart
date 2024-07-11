import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/shadow_styles.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/admin_blog_details.dart';
import 'package:t_store/features/recepie/controllers/blog_controller.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';
import 'package:t_store/features/recepie/screens/blogs/widgets/blogCard.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class AdminPendingBlogList extends StatelessWidget {
  const AdminPendingBlogList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(BlogController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pending Blogs',
          style: TextStyle(
            color: dark ? TColors.dark : Color(0xFFE85A4F),
            fontWeight: FontWeight.bold,
          ),
        ),
        // centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SizedBox(
                child: Obx(() {
                  if(controller.isLoading.value) return const TVerticalProductShimmer();

                  if(controller.pendingBlogs.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return GridView.builder(
                    itemCount: controller.pendingBlogs.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 288,
                      mainAxisSpacing: TSizes.gridViewSpacing,
                      crossAxisSpacing: TSizes.gridViewSpacing,
                    ),
                    itemBuilder: (_, index) => BlogCard(blog: controller.pendingBlogs[index]),
                  );
                }
                ),
              ),
          ),
        ),
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.blog});

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => AdminBlogPage(blog: blog)),
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
              padding: const EdgeInsets.all(TSizes.sm,),
              backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F),
              child: Stack(
                children: [
                  //thumbnail image
                  Center(
                    child: TRoundedImage(
                      height: 150,
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
                    TBrandTitleWithVerifiedIcon(title: "by ${blog.title}", textColor: dark ? TColors.light : TColors.dark),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    //content
                    TBrandTitleWithVerifiedIcon(title: blog.content, textColor: dark ? TColors.light : TColors.dark, maxLines: 5,),
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
