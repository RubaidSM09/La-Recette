import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/pending_recipe.dart';
import 'package:t_store/features/recepie/controllers/blog_controller.dart';
import 'package:t_store/features/recepie/controllers/recipe/addrecipe_ingredients_controller.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class AdminBlogPage extends StatelessWidget {
  const AdminBlogPage({super.key, required this.blog});

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    final BlogController controller = Get.put(BlogController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header image
            Container(
              height: 244,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(blog.image!.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                blog.title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFFE85A4F),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),

            // Chef's name
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'by ${blog.author}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  height: 1.5,
                  color: dark ? TColors.dark : TColors.light,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Description Section
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Container(
                width: 332,
                // height: 98,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    blog.content,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                      height: 1.5,
                      color: Colors.black.withOpacity(0.72),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            Center(
              child: SizedBox(
                  width: 180,
                  child: ElevatedButton(onPressed: () {
                    controller.isPending.value = false;
                    controller.blogId.value = blog.id;
                    controller.approveBlog();
                    Get.to(() => const NavigationMenu());
                  }, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text("Accept", style: TextStyle(color: TColors.dark),))
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: SizedBox(
                  width: 180,
                  child: ElevatedButton(onPressed: () {
                    controller.blogId.value = blog.id;
                    controller.declineBlog();
                    Get.to(() => const NavigationMenu());
                  }, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text("Reject", style: TextStyle(color: TColors.dark),))
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }

  Widget buildIngredientRow(String ingredient, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient,
            style: const TextStyle(fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              quantity,
              style: const TextStyle(fontSize: 12, color: Color(0xFFE85A4F)),
            ),
          ),
        ],
      ),
    );
  }
}
