import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/ingredients/ingredients_cards/ingredient_card_vertical.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/recepie/controllers/ingredient_controller.dart';
import 'package:t_store/features/recepie/screens/ingredients/add_ingredients/add_ingredients.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class IngredientsScreen extends StatelessWidget {
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(IngredientController());
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: TAppBar(
        title: Text('Ingredients', style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F))),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F),
        onPressed: () => Get.to(() => const AddIngredientsScreen()),
        child: Icon(Icons.add, color: dark ? TColors.light : TColors.dark,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: TSizes.defaultSpace),
          child: Column(
              children: [
                TSearchContainer(
                    controller: searchController,
                    text: 'Search Ingredients',
                  onTap: () {
                    controller.searchIngredients(searchController.text);
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.filteredIngredients.isEmpty) {
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                        itemCount: searchController.text.isEmpty ? controller.allIngredients.length : controller.filteredIngredients.length,
                        itemBuilder: (_, index) {
                          if (searchController.text.isEmpty) {
                            return TIngredientCardVertical(ingredient: controller.allIngredients[index]);
                          } else {
                            return TIngredientCardVertical(ingredient: controller.filteredIngredients[index]);
                          }
                        },
                    );
                  }),
                )
              ],
            ),
        ),
        ),
      // body: Container(color: Colors.blue,),
    );
  }
  
}