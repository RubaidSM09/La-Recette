
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';

import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/recepie/controllers/category_controller.dart';
import 'package:t_store/features/recepie/controllers/recipe/recipe_controller.dart';

import 'package:t_store/features/recepie/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/recepie/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/recepie/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';

import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/recepies/recepie_cards/product_card_vertical.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(RecipeController());

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(
                    text: 'Search',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TSectionHeading(
                              title: 'Categories',
                              showActionButton: false,
                              textColor: dark ? TColors.dark : const Color(0xFFE85A4F),
                            ),
                            TextButton(onPressed: () {}, child: Text('Search by Ingredients', style: TextStyle(color: dark ? TColors.dark: const Color(0xFFE85A4F)),)),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const THomeCategories()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Obx(() {
                  if(controller.isLoading.value) return const TVerticalProductShimmer();

                  if(controller.approvedRecipes.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return TGridLayout(
                      itemCount: controller.approvedRecipes.length,
                      itemBuilder: (_, index) => TProductCardVertical(recipe: controller.approvedRecipes[index],));
                }),
                ),
            ],
          ),
      ),
      // body: Container(color: Colors.red,),
    );
  }
}