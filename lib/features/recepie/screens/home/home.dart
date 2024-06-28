
import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/texts/section_heading.dart';

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
                child: TGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) => const TProductCardVertical()),
                ),
            ],
          ),
      ),
      // body: Container(color: Colors.red,),
    );
  }
}