// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/recepies/recepie_cards/product_card_horizontal.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class MealPlannerResultScreen extends StatelessWidget {
  const MealPlannerResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    int ItemCount = 0;

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Meal Planner',
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Plan for 1 Day:',
                style: TextStyle(
                  color: dark ? TColors.dark : TColors.light,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Text(
                'Breakfast Options:',
                style: TextStyle(
                  color: dark ? TColors.dark : TColors.light,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => const TProductCardHorizontal(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),Text(
                'Lunch Options:',
                style: TextStyle(
                  color: dark ? TColors.dark : TColors.light,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => const TProductCardHorizontal(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Text(
                'Dinner Options:',
                style: TextStyle(
                  color: dark ? TColors.dark : TColors.light,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => const TProductCardHorizontal(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
            ],
          ),
        ),
      ),
    );
  }
}
