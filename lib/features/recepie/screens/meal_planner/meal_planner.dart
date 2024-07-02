// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/ingredients/ingredients_cards/product_card_horizontal.dart';
import 'package:t_store/features/recepie/screens/meal_planner/meal_planner_result.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class MealPlannerScreen extends StatelessWidget {
  const MealPlannerScreen({super.key});

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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Ingredients:',
                    style: TextStyle(
                      color: dark ? TColors.dark : TColors.light,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  /// Ingredients
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 270,
                        child: TextFormField(
                          decoration:  InputDecoration(
                              filled: true, // This makes the field background white
                              fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                              ),
                              labelText: 'Ingredients',
                              labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F))
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 60, child: ElevatedButton(onPressed: () { ItemCount++; }, style: ElevatedButton.styleFrom(backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F)), child: Icon(Icons.add, color: dark ? TColors.light : TColors.dark,))
                      ),
                    ],
                  ),
                ],
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plan Meal for: ',
                    style: TextStyle(
                      color: dark ? TColors.dark : TColors.light,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                      Text('Breakfast', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                    ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('Lunch', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('Dinner', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('1 Day', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('2 Days', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('3 Days', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('4 Days', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('5 Days', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('6 Days', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}, activeColor: dark ? TColors.dark : const Color(0xFFE85A4F), checkColor: dark ? TColors.light : TColors.dark,),
                        Text('1 Week', style: TextStyle(color: dark ? TColors.dark : TColors.light,),)
                      ]
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Sign in button
              SizedBox(
                  width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const MealPlannerResultScreen()), style: ElevatedButton.styleFrom(backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F)), child: Text('Plan My Meal', style: TextStyle(color: dark ? TColors.light : TColors.dark),))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
