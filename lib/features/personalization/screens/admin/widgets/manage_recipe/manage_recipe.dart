import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/ingredients/ingredients_cards/ingredient_card_vertical.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/recepies/recepie_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/manage_recipe/manage_recipe_card.dart';
// import 'package:t_store/features/recepie/controllers/ingredient_controller.dart';
import 'package:t_store/features/recepie/controllers/recipe/recipe_controller.dart';
// import 'package:t_store/features/recepie/screens/ingredients/add_ingredients/add_ingredients.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

// import '../../../../common/widgets/appbar/appbar.dart';

class ManageRecipePage extends StatelessWidget {
  const ManageRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = RecipeController.instance;
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: TAppBar(
        title: Text('Manage Recipes', style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: TSizes.defaultSpace),
          child: Column(
            children: [
              TSearchContainer(
                controller: searchController,
                text: 'Search Recipes',
                onTap: () {
                  controller.searchRecipes(searchController.text);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Obx(() {
                  if(controller.isLoading.value) return const TVerticalProductShimmer();

                  if(controller.filteredRecipes.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return TGridLayout(
                    itemCount: searchController.text.isEmpty ? controller.approvedRecipes.length : controller.filteredRecipes.length,
                    itemBuilder: (_, index) {
                      if (searchController.text.isEmpty) {
                        return ManageRecipeCard(recipe: controller.approvedRecipes[index]);
                      } else {
                        return ManageRecipeCard(recipe: controller.filteredRecipes[index]);
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